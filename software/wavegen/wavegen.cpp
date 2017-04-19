/* wavegen.cpp
 * Copyright (C) 2017 Tim Prince
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "wavegen.h"

#include <cstdlib>
#include <cstring>
#include <memory>
#include <sstream>
#include <type_traits>
#include <utility>

#include "ad9837.h"
#include "util.h"
#include <ftdi.h>

#define XSTR(str) #str
#define STR(str) XSTR(str)
#define WHEN(str) __FILE__ ":" STR(__LINE__) ": " str

namespace wavegen {

namespace {

enum pins : uint8_t {
    adbus0 = 0x01,
    adbus1 = 0x02,
    adbus2 = 0x04,
    adbus3 = 0x08,
    adbus4 = 0x10,
    adbus5 = 0x20,
    adbus6 = 0x40,
    adbus7 = 0x80,

    sck = adbus0,
    sdata = adbus1,
    nfsync = adbus3
};

constexpr int vid = 0x0403;
constexpr int pid = 0x6010;

constexpr uint8_t output_pins = pins::sck | pins::sdata | pins::nfsync;
constexpr int baudrate = 1000000 / 4; /* 1 MHz */

/*
 * The libftdi macros result in an int being deduced by default, but
 * they are always packed into a uint8. This enum makes sure we don't
 * accidentally expand them.
 */
enum class opcodes : uint8_t {
    clkdiv_5_disable = DIS_DIV_5,
    clkdiv_5_enable = EN_DIV_5,
    adaptive_clk_disable = DIS_ADAPTIVE,
    adaptive_clk_enable = EN_ADAPTIVE,
    three_phase_disable = DIS_3_PHASE,
    three_phase_enable = EN_3_PHASE,
    set_clkdiv = TCK_DIVISOR,
    set_low_bits = SET_BITS_LOW,
    set_high_bits = SET_BITS_HIGH,
    loopback_enable = LOOPBACK_START,
    loopback_disable = LOOPBACK_END,
    write = MPSSE_DO_WRITE,
    bogus = 0xab
};

constexpr uint8_t bad_opcode_reply = 0xfa;
constexpr uint16_t spi_clkdiv = 0x05db; /* 1 MHz */

static wavegen_error format_error(
    std::string when, ftdi_context *ctxt)
{
    when += ": ";
    when += ftdi_get_error_string(ctxt);
    return wavegen_error(when);
}

template<size_t Size>
size_t pack_impl(uint8_t *buffer)
{
    return 0;
}

template<size_t Size, class T, class... Args>
size_t pack_impl(uint8_t *buffer, T&& arg, Args&&... args) {
    static_assert(
        std::is_pod<std::remove_reference<T>>(),
        "Cannot pack a non-POD into a buffer."
    );
    static_assert(sizeof(T) < Size, "Buffer overflow when expanding a pack.");

    memcpy(buffer, &arg, sizeof(T));
    return sizeof(T) + pack_impl<Size - sizeof(T)>(
        buffer + sizeof(T), std::forward<Args>(args)...
    );
}

template<size_t Size, class... Args>
size_t pack(uint8_t (&buffer)[Size], Args&&... args) {
    return pack_impl<Size>(buffer, std::forward<Args>(args)...);
}

} /* namespace */

struct wavegen::detail::packet
{
    template<class... Args>
    packet(Args&&... args)
    {
        size = pack(buffer, std::forward<Args>(args)...);
    }

    void append(const packet& p) {
        if (p.size + size > sizeof(buffer)) {
            throw wavegen_error(WHEN("overflowed buffer constructing packet."));
        }
        memcpy(&buffer[size], p.buffer, p.size);
        size += p.size;
    }

    uint8_t buffer[16];
    uint8_t size = 0;
};
using wavegen::detail::packet;

namespace {

packet fsyncPacket(bool fsyncHigh)
{
    uint8_t pin_state =
        pins::sck |
        (fsyncHigh ? pins::nfsync : 0);
    return {
        opcodes::set_low_bits,
        pin_state,
        uint8_t(pins::sck | pins::sdata | pins::nfsync)
    };
}

} /* namespace */

device::device() :
    ctxt { ftdi_new() },
    mclk_freq { ad9837::default_mclk_freq }
{
    if (ftdi_set_interface(ctxt, INTERFACE_A)) {
        onFtdiError(WHEN("ftdi_set_interface"));
    }

    if (ftdi_usb_open_desc(ctxt, vid, pid, "USB Function Generator", nullptr)) {
        onFtdiError(WHEN("ftdi_usb_open_desc"));
    }

    if (ftdi_set_bitmode(ctxt, 0, BITMODE_RESET)) {
        onFtdiError(WHEN("ftdi_set_bitmode"));
    }

    if (ftdi_set_bitmode(ctxt, 0, BITMODE_MPSSE)) {
        onFtdiError(WHEN("ftdi_set_bitmode"));
    }

    sync();

    /* Set up basic parameters. */
    sendCommand({
            opcodes::clkdiv_5_enable,
            opcodes::adaptive_clk_disable,
            opcodes::three_phase_disable
    });

    /* Set the baudrate. */
    sendCommand({
        opcodes::set_clkdiv, spi_clkdiv
    });

    /* Configure pin states. */
    sendCommand(fsyncPacket(/*fsyncHigh*/true));
    sendCommand({
        opcodes::set_high_bits,
        uint8_t(0),
        uint8_t(0)
    });
    expectEmptyResponse();

    init_dac();
    expectEmptyResponse();

    init_done = true;
}

device::~device() noexcept(true)
{
    ftdi_free(ctxt);
}

device::device(device&& o) noexcept(true) :
    ctxt { o.ctxt }
{
    o.ctxt = nullptr;
}

device& device::operator=(device&& o) noexcept(true) {
    std::swap(o.ctxt, ctxt);
    return *this;
}

void device::setClockFrequency(uint32_t freq)
{
    mclk_freq = freq;
}

void device::setFrequency(channel_id channel, uint32_t freq)
{
    if (freq >= ad9837::default_mclk_freq) {
        onLogicalError(WHEN("unsupported frequency"));
    }
    uint16_t freg_hi;
    uint16_t freg_lo;
    ad9837::compute_freg(freq, mclk_freq, freg_hi, freg_lo);

    uint16_t reg_mask = (channel == 0) ?
        ad9837::reg_mask::freq0 :
        ad9837::reg_mask::freq1 ;

    freg_hi |= reg_mask;
    freg_lo |= reg_mask;

    sendData({byteswap(freg_lo)});
    sendData({byteswap(freg_hi)});
}

void device::setPhase(channel_id channel, uint16_t phase)
{
    if (phase & ~mask(12U)) {
        onLogicalError(WHEN("unsupported phase"));
    }
    uint16_t data = (channel == 0) ?
        ad9837::reg_mask::phase0 :
        ad9837::reg_mask::phase1 ;

    data |= phase;
    sendData({byteswap(data)});
}

void device::setOutput(output_waveform type, channel_id channel)
{
    using namespace ad9837;
    uint16_t command = reg_mask::control;
    command |= ctrl_bits::b28;

    if (channel == 1) {
        command |= ctrl_bits::fsel;
        command |= ctrl_bits::psel;
    }

    switch (type) {
    case output_waveform::sinusoid:
        break;
    case output_waveform::triangle:
        command |= ctrl_bits::mode;
        break;
    case output_waveform::square:
        command |= ctrl_bits::opbiten;
        break;
    }

    sendData({byteswap(command)});
}

void device::sync()
{
    uint8_t buffer[2];
    sendCommand(opcodes::loopback_enable);
    expectEmptyResponse();

    sendCommand(opcodes::bogus);

    expectResponse({
        bad_opcode_reply,
        opcodes::bogus,
    });
    expectEmptyResponse();

    sendCommand(opcodes::loopback_disable);
}

void device::init_dac()
{
    packet ctrl_reset = {
        uint8_t(0b00100001),
        uint8_t(0b00000000)
    };
    packet ctrl_enable = {
        uint8_t(0b00100000),
        uint8_t(0b00000000)
    };

    sendData(ctrl_reset);
    setFrequency(0, 0);
    setFrequency(1, 0);
    setPhase(0, 0);
    setPhase(1, 0);

    setOutput(output_waveform::sinusoid, 0);
}

void device::writeFSync(bool high) {
    uint8_t pin_state =
        pins::sck |
        (high ? pins::nfsync : 0);
    sendCommand({
        opcodes::set_low_bits,
        pin_state,
        uint8_t(pins::sck | pins::sdata | pins::nfsync)
    });
}

void device::sendCommand(const packet& p)
{
    if (ftdi_write_data(ctxt, const_cast<uint8_t*>(p.buffer), p.size) != p.size) {
        onFtdiError(WHEN("ftdi_write_data"));
    }
}

void device::sendData(const packet& payload)
{
    if (payload.size < 1) {
        onLogicalError(WHEN("can't send a packet with <1 bytes."));
    }

    packet p;
    p.append(fsyncPacket(false));
    p.append({ opcodes::write, uint16_t(payload.size - 1) });
    p.append(payload);
    p.append(fsyncPacket(true));
    sendCommand(p);
}


void device::onFtdiError(const std::string& when)
{
    auto exn = format_error(when, ctxt);

    if (!init_done) {
        ftdi_free(ctxt);
        ctxt = nullptr;
    }
    throw exn;
}

void device::onLogicalError(const std::string& what)
{
    auto exn = wavegen_error(what);

    if (!init_done) {
        ftdi_free(ctxt);
        ctxt = nullptr;
    }
    throw exn;
}

void device::expectResponse(const packet& p)
{
    uint8_t buffer[p.size];
    int rc = ftdi_read_data(ctxt, buffer, p.size);
    if (rc != p.size) {
        std::ostringstream what;
        what << WHEN()
             << "expected " << p.size << " byte reply but got "
             << rc << " bytes.";
        onLogicalError(what.str());
    }

    if (memcmp(p.buffer, buffer, p.size) != 0) {
        onLogicalError(WHEN("did not receive expected reply"));
    }
}

void device::expectEmptyResponse()
{
    expectResponse(packet { });
}


} /* namespace wavegen */

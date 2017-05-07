/* ft2232h-spi-libftdi.cpp
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

#include "ft2232h-spi.h"

#include <sstream>
#include <ftdi.h>

#include "packet.h"
#include "util.h"

namespace wavegen {

namespace {
constexpr uint16_t spi_clkdiv = 0x05db; /* 1 MHz */
constexpr uint8_t bad_opcode_reply = 0xfa;
}

struct ft2232h_spi::impl
{
    impl(pins cs_pin) :
        ctxt(ftdi_new()),
        cs_pin(cs_pin)
    {
    }
    ~impl() {
        ftdi_free(ctxt);
    }

    packet csPacket(bool cs_high);
    void init(int vid, int pid, const char *descr, const char *serial);
    void sendRaw(const packet& p);
    void sync();
    void expectResponse(const packet& p);
    void expectEmptyResponse();
    void onError(const std::string& when);

    struct ftdi_context *ctxt;
    pins cs_pin;
};

ft2232h_spi::~ft2232h_spi()
{
}

ft2232h_spi::ft2232h_spi(
    pins cs, int vid, int pid,
    const char *descr, const char *serial)
    noexcept(false) :
    d(new impl { cs })
{
    d->init(vid, pid, descr, serial);
}

ft2232h_spi::ft2232h_spi(ft2232h_spi&& other) noexcept(true)
    : d(std::move(other.d))
{
}

ft2232h_spi& ft2232h_spi::operator=(ft2232h_spi&& other) noexcept(true)
{
    std::swap(d, other.d);
    return *this;
}

void ft2232h_spi::transmit(const packet& payload)
{
    if (payload.size < 1) {
        throw error(WHEN("can't send a packet with <1 bytes."));
    }

    packet p;
    p.append(d->csPacket(false));
    p.append({ opcodes::write, uint16_t(payload.size - 1) });
    p.append(payload);
    p.append(d->csPacket(true));
    d->sendRaw(p);
    d->expectEmptyResponse();
}

void ft2232h_spi::impl::sendRaw(const packet& p)
{
    if (ftdi_write_data(ctxt, const_cast<uint8_t*>(p.buffer), p.size) != p.size) {
        onError(WHEN("ftdi_write_data"));
    }
}

packet ft2232h_spi::impl::csPacket(bool cs_high)
{
    uint8_t pin_state =
        ft2232h_spi::pins::sck |
        (cs_high ? cs_pin : 0);
    return {
        opcodes::set_low_bits,
        pin_state,
        uint8_t(pins::sck | pins::sdata | cs_pin)
    };
}

void ft2232h_spi::impl::init(
    int vid, int pid,
    const char *descr, const char *serial)
{
    if (ftdi_set_interface(ctxt, INTERFACE_A)) {
        onError(WHEN("ftdi_set_interface"));
    }

    if (ftdi_usb_open_desc(ctxt, vid, pid, descr, serial)) {
        onError(WHEN("ftdi_usb_open_desc"));
    }

    if (ftdi_set_bitmode(ctxt, 0, BITMODE_RESET)) {
        onError(WHEN("ftdi_set_bitmode"));
    }

    if (ftdi_set_bitmode(ctxt, 0, BITMODE_MPSSE)) {
        onError(WHEN("ftdi_set_bitmode"));
    }

    sync();

    /* Set up basic parameters. */
    sendRaw({
        opcodes::clkdiv_5_enable,
        opcodes::adaptive_clk_disable,
        opcodes::three_phase_disable
    });

    /* Set the baudrate. */
    sendRaw({
        opcodes::set_clkdiv, spi_clkdiv
    });

    /* Configure pin states. */
    sendRaw(csPacket(true));
    sendRaw({
        opcodes::set_high_bits,
        uint8_t(0),
        uint8_t(0)
    });
    expectEmptyResponse();
}

void ft2232h_spi::impl::sync()
{
    uint8_t buffer[2];
    sendRaw(opcodes::loopback_enable);
    expectEmptyResponse();

    sendRaw(opcodes::bogus);

    expectResponse({
        bad_opcode_reply,
        opcodes::bogus,
    });
    expectEmptyResponse();

    sendRaw(opcodes::loopback_disable);
}

void ft2232h_spi::impl::expectResponse(const packet& p)
{
    uint8_t buffer[p.size];
    int rc = ftdi_read_data(ctxt, buffer, p.size);
    if (rc != p.size) {
        std::ostringstream what;
        what << WHEN()
             << "expected " << p.size << " byte reply but got "
             << rc << " bytes.";
        onError(what.str());
    }

    if (memcmp(p.buffer, buffer, p.size) != 0) {
        onError(WHEN("did not receive expected reply"));
    }
}

void ft2232h_spi::impl::expectEmptyResponse()
{
    expectResponse(packet {});
}

void ft2232h_spi::impl::onError(const std::string& when)
{
    throw ftdi_error(when + ": " + ftdi_get_error_string(ctxt));
}

} /* namespace wavegen */

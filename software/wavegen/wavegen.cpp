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
#include "exceptions.h"
#include "packet.h"
#include "util.h"

namespace wavegen {

namespace {

constexpr int vid = 0x0403;
constexpr int pid = 0x6010;

} /* namespace */

device::device() :
    spi { ftdi::spi::pins::adbus3, vid, pid, "USB Function Generator" },
    mclk_freq { ad9837::default_mclk_freq }
{
    initDac();
}

device::~device() noexcept(true)
{
}

device::device(device&& o) noexcept(true) :
    spi { std::move(o.spi) },
    mclk_freq { o.mclk_freq }
{
}

device& device::operator=(device&& o) noexcept(true) {
    std::swap(o.spi, spi);
    mclk_freq = o.mclk_freq;
    return *this;
}

void device::setClockFrequency(uint32_t freq)
{
    mclk_freq = freq;
}

void device::setFrequency(channel_id channel, uint32_t freq)
{
    if (freq >= ad9837::default_mclk_freq) {
        throw error(WHEN("unsupported frequency"));
    }
    uint16_t freg_hi;
    uint16_t freg_lo;
    ad9837::compute_freg(freq, mclk_freq, freg_hi, freg_lo);

    uint16_t reg_mask = (channel == 0) ?
        ad9837::reg_mask::freq0 :
        ad9837::reg_mask::freq1 ;

    freg_hi |= reg_mask;
    freg_lo |= reg_mask;

    spi.transmit({byteswap(freg_lo)});
    spi.transmit({byteswap(freg_hi)});
}

void device::setPhase(channel_id channel, uint16_t phase)
{
    if (phase & ~mask(12U)) {
        throw error(WHEN("unsupported phase"));
    }
    uint16_t data = (channel == 0) ?
        ad9837::reg_mask::phase0 :
        ad9837::reg_mask::phase1 ;

    data |= phase;
    spi.transmit({byteswap(data)});
}

void device::setOutput(channel_id channel, output_waveform type)
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

    spi.transmit({byteswap(command)});
}

void device::initDac()
{
    packet ctrl_reset = {
        uint8_t(0b00100001),
        uint8_t(0b00000000)
    };

    spi.transmit(ctrl_reset);
    setFrequency(0, 0);
    setFrequency(1, 0);
    setPhase(0, 0);
    setPhase(1, 0);

    setOutput(0);
}

} /* namespace wavegen */

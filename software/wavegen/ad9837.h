/* ad9837.h
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
#ifndef WAVEGEN_AD9837_H
#define WAVEGEN_AD9837_H

#include <cstdint>

namespace wavegen {
namespace ad9837 {

constexpr uint32_t mclk_freq = 16000000;

enum reg_mask : uint16_t {
    control = 0x0000,
    freq0 = 0x4000,
    freq1 = 0x8000,
    phase0 = 0xc000,
    phase1 = 0xd000
};

enum ctrl_bits : uint16_t {
    b28     = 0x2000,
    hlb     = 0x1000,
    fsel    = 0x0800,
    psel    = 0x0400,
    reset   = 0x0100,
    sleep1  = 0x0080,
    sleep12 = 0x0040,
    opbiten = 0x0020,
    div2    = 0x0008,
    mode    = 0x0002
};

/*
 * Compute the value of the frequency register for the given target frequency.
 * Returns the result as a 28-bit value split into two 14-bit values, as is
 * required by the underlying SPI protocol.
 */
void compute_freg(uint32_t frequency, uint16_t& high, uint16_t& low);

} /* namespace ad9837 */

} /* namespace wavegen */

#endif /* WAVEGEN_AD9837_H */

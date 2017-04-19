/* ad9837.cpp
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

#include "ad9837.h"

#include "util.h"

void wavegen::ad9837::compute_freg(
    uint32_t frequency,
    uint16_t& high,
    uint16_t& low)
{
    uint64_t result = frequency;
    result <<= 28;
    result /= mclk_freq;

    high = (result >> 14) & mask(14);
    low  = result & mask(14);
}

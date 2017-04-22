/* ft2232h-spi.h
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
#ifndef WAVEGEN_FT2232H_SPI_H
#define WAVEGEN_FT2232H_SPI_H

#include <memory>

#include "wavegen/exceptions.h"

namespace wavegen
{

struct packet;

struct ftdi_error : public error
{
public:
    ftdi_error(const std::string& what) : error(what) { }
};

struct ft2232h_spi
{
public:
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
        sdata = adbus1
    };

    virtual ~ft2232h_spi() noexcept(true);

    ft2232h_spi(pins cs_pin, int vid, int pid, const char *descr);
    ft2232h_spi(const ft2232h_spi&) = delete;
    ft2232h_spi(ft2232h_spi&&) noexcept(true);

    ft2232h_spi& operator=(const ft2232h_spi&) = delete;
    ft2232h_spi& operator=(ft2232h_spi&&) noexcept(true);

    void transmit(const packet& p);

private:
    enum class opcodes : uint8_t {
        write                = 0x10,
        set_low_bits         = 0x80,
        set_high_bits        = 0x82,
        loopback_enable      = 0x84,
        loopback_disable     = 0x85,
        set_clkdiv           = 0x86,
        clkdiv_5_disable     = 0x8a,
        clkdiv_5_enable      = 0x8b,
        three_phase_enable   = 0x8c,
        three_phase_disable  = 0x8d,
        adaptive_clk_enable  = 0x96,
        adaptive_clk_disable = 0x97,
        bogus                = 0xab
    };


    struct impl;
    std::unique_ptr<impl> d;
};

} /* namespace wavegen */

#endif /* WAVEGEN_FT2232H_SPI_H */

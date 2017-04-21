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

#include "packet.h"
#include "util.h"

namespace wavegen {

struct ft2232h_spi::impl
{
    impl(pins cs_pin) :
        cs_pin(cs_pin)
    {
    }

    packet csPacket(bool cs_high)
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

    void init(int vid, int pid, const char *descr);
    void sendRaw(const packet& p);
    void sync();
    void expectResponse(const packet& p);
    void expectEmptyResponse();
    void onError(const std::string& when);

    pins cs_pin;
};

ft2232h_spi::~ft2232h_spi()
{
}

ft2232h_spi::ft2232h_spi(pins cs, int vid, int pid, const char *descr)
    noexcept(false) :
    d(new impl { cs })
{
    d->init(vid, pid, descr);
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
}

void ft2232h_spi::impl::init(int vid, int pid, const char *descr)
{
}

void ft2232h_spi::impl::sync()
{
}

void ft2232h_spi::impl::expectResponse(const packet& p)
{
}

void ft2232h_spi::impl::expectEmptyResponse()
{
    expectResponse(packet {});
}

void ft2232h_spi::impl::onError(const std::string& when)
{
}

} /* namespace wavegen */

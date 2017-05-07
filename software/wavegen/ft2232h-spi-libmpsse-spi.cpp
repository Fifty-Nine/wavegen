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

#include <Windows.h>
extern "C" {
#include <libMPSSE_spi.h>
}

#include "packet.h"
#include "util.h"

namespace wavegen {
namespace ftdi {

static void onError(const std::string& when)
{
	throw error(when);
}


struct spi::impl
{
    impl(pins cs_pin) :
		cs_pin { cs_pin },
		handle { }
    {
		Init_libMPSSE();
    }

	~impl()
	{
		if (handle) SPI_CloseChannel(handle);
		Cleanup_libMPSSE();
	}

    packet csPacket(bool cs_high)
    {
        uint8_t pin_state =
            spi::pins::sck |
            (cs_high ? cs_pin : 0);
        return {
            opcodes::set_low_bits,
            pin_state,
            uint8_t(pins::sck | pins::sdata | cs_pin)
        };
    }

	uint32 findChannel(const endpoint& ep);
    void init(const endpoint& ep);

    pins cs_pin;
	FT_HANDLE handle;
};

spi::~spi()
{
}

spi::spi(pins cs, const endpoint& ep) noexcept(false) :
    d(new impl { cs })
{
    d->init(ep);
}

spi::spi(spi&& other) noexcept(true)
    : d(std::move(other.d))
{
}

spi& spi::operator=(spi&& other) noexcept(true)
{
    std::swap(d, other.d);
    return *this;
}

void spi::transmit(const packet& payload)
{
    if (payload.size < 1) {
        throw error(WHEN("can't send a packet with <1 bytes."));
    }

	constexpr auto options =
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE;
	uint32 xferred = 0;
	if (SPI_Write(d->handle, const_cast<uint8*>(payload.buffer), payload.size, &xferred, options)) {
		onError("SPI_Write");
	}
	if (xferred != payload.size) {
		onError("SPI_Write: Incomplete write.");
	}
}

uint32 spi::impl::findChannel(const endpoint& ep)
{
	uint32 numChannels;
	if (SPI_GetNumChannels(&numChannels)) {
		onError(WHEN("SPI_GetNumChannels"));
	}

	if (numChannels < 1) {
		onError("No device available.");
	}

    auto match = [ep] (const FT_DEVICE_LIST_INFO_NODE& info)
    {
        int ch_vid = (info.ID >> 16) & 0xFFFF;
        int ch_pid = (info.ID      ) & 0xFFFF;

        return equal_or_defaulted(ep.vid, ch_vid) &&
            equal_or_defaulted(ep.pid, ch_pid) &&
            equal_or_defaulted<std::string>(ep.description + " A", info.Description) &&
            equal_or_defaulted<std::string>(ep.serial + "A", info.SerialNumber);
    };

	for (uint32 i = 0; i < numChannels; ++i) {
		FT_DEVICE_LIST_INFO_NODE channel_info;
		if (SPI_GetChannelInfo(i, &channel_info)) {
			onError(WHEN("SPI_GetChannelInfo"));
		}

        if (match(channel_info)) { return (int)i; }
	}
	onError("No matching devices found.");
}

void spi::impl::init(const endpoint& ep)
{
	auto channel = findChannel(ep);

	if (SPI_OpenChannel(channel, &handle)) {
		onError("SPI_OpenChannel");
	}

	uint32 cs_bits =
		cs_pin == pins::adbus3 ? SPI_CONFIG_OPTION_CS_DBUS3 :
		cs_pin == pins::adbus4 ? SPI_CONFIG_OPTION_CS_DBUS4 :
		cs_pin == pins::adbus5 ? SPI_CONFIG_OPTION_CS_DBUS5 :
		cs_pin == pins::adbus6 ? SPI_CONFIG_OPTION_CS_DBUS6 :
		cs_pin == pins::adbus7 ? SPI_CONFIG_OPTION_CS_DBUS7 :
		0xff;
	if (cs_bits == 0xff) {
		onError("Invalid chip select pin setting.");
	}

	ChannelConfig config = { };
	config.ClockRate = 1000000;
	config.LatencyTimer = 1;
	config.configOptions = SPI_CONFIG_OPTION_MODE2 | cs_bits | SPI_CONFIG_OPTION_CS_ACTIVELOW;
	config.Pin = sck | sdata | cs_pin | ((sck | cs_pin) << 8);

	if (SPI_InitChannel(handle, &config)) {
		onError(WHEN("SPI_InitChannel"));
	}
}

} /* namespace ftdi */

std::vector<ftdi::endpoint> ftdi::getAvailableEndpoints(int vid, int pid)
{
	uint32 numChannels;
	if (SPI_GetNumChannels(&numChannels)) {
		onError(WHEN("SPI_GetNumChannels"));
	}

    std::vector<ftdi::endpoint> result;
    result.reserve(numChannels);

    for (unsigned i = 0; i < numChannels; ++i) {
        FT_DEVICE_LIST_INFO_NODE channel_info;
        if (SPI_GetChannelInfo(i, &channel_info)) {
            onError(WHEN("SPI_GetChannelInfo"));
        }
        std::string desc = channel_info.Description;
        std::string serial = channel_info.SerialNumber;

        /* Ignore channel B. */
        if (desc.size() > 2 && desc.back() == 'B') {
            continue;
        }

        /* Lop off the channel identifier. */
        if (desc.size() > 2 && desc.back() == 'A') {
            desc = desc.substr(0, desc.size() - 2);
        }

        if (serial.size() > 1 && serial.back() == 'A') {
            serial = serial.substr(0, serial.size() - 1);
        }

        result.emplace_back(
            vid, pid,
            /*mfg*/ std::string { },
            desc,
            serial
        );
    }

    return result;
}

} /* namespace wavegen */

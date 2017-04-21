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

struct ft2232h_spi::impl
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
            ft2232h_spi::pins::sck |
            (cs_high ? cs_pin : 0);
        return {
            opcodes::set_low_bits,
            pin_state,
            uint8_t(pins::sck | pins::sdata | cs_pin)
        };
    }

	uint32 findChannel(int vid, int pid, const char *descr);
    void init(int vid, int pid, const char *descr);
    void onError(const std::string& when);

    pins cs_pin;
	FT_HANDLE handle;
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

	constexpr auto options =
		SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
		SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE;
	uint32 xferred = 0;
	if (SPI_Write(d->handle, const_cast<uint8*>(payload.buffer), payload.size, &xferred, options)) {
		d->onError("SPI_Write");
	}
	if (xferred != payload.size) {
		d->onError("SPI_Write: Incomplete write.");
	}
}

uint32 ft2232h_spi::impl::findChannel(int vid, int pid, const char *descr)
{
	uint32 numChannels;
	if (SPI_GetNumChannels(&numChannels)) {
		onError(WHEN("SPI_GetNumChannels"));
	}

	if (numChannels < 1) {
		onError("No device available.");
	}

	std::string expected_descr{ descr };
	expected_descr += " A";

	for (uint32 i = 0; i < numChannels; ++i) {
		FT_DEVICE_LIST_INFO_NODE channel_info;
		if (SPI_GetChannelInfo(i, &channel_info)) {
			onError(WHEN("SPI_GetChannelInfo"));
		}
		int channel_vid = (channel_info.ID >> 16) & 0xFFFF;
		int channel_pid = channel_info.ID & 0xFFFF;

		if ((channel_vid == vid) &&
			(channel_pid == pid) &&
			(channel_info.Description == expected_descr))
		{
			return (int)i;
		}
	}
	onError("No matching devices found.");
}

void ft2232h_spi::impl::init(int vid, int pid, const char *descr)
{
	auto channel = findChannel(vid, pid, descr);

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

void ft2232h_spi::impl::onError(const std::string& when)
{
	throw ftdi_error(when);
}

} /* namespace wavegen */

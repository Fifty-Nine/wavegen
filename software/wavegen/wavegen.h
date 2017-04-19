/* wavegen.h
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
#ifndef WAVEGEN_H
#define WAVEGEN_H

#include <cstdint>
#include <stdexcept>
#include <initializer_list>

struct ftdi_context;

namespace wavegen {

namespace detail { struct packet; }

using channel_id = uint8_t;

enum class output_waveform
{
    sinusoid,
    triangle,
    square
};


class device final
{
public:
    ~device() noexcept(true);
    device() noexcept(false);
    device(const device&) = delete;
    device(device&&) noexcept(true);

    device& operator=(const device&) = delete;
    device& operator=(device&&) noexcept(true);

    void setClockFrequency(uint32_t freq);
    void setFrequency(channel_id channel, uint32_t freq);
    void setPhase(channel_id channel, uint16_t phase);
    void setOutput(output_waveform type, channel_id channel);

private:
    void sync();
    void init_dac();

    void writeFSync(bool high);
    void sendCommand(const detail::packet& p);
    void sendData(const detail::packet& p);
    void onFtdiError(const std::string& when);
    void onLogicalError(const std::string& what);
    void expectResponse(const detail::packet& p);
    void expectEmptyResponse();

    struct ftdi_context *ctxt;
    bool init_done = false;
    uint32_t mclk_freq;
};

class wavegen_error : public std::runtime_error
{
public:
    wavegen_error(const std::string& what) :
        std::runtime_error(what)
    { }
};

} /* namespace wavegen */

#endif /* WAVEGEN_H */

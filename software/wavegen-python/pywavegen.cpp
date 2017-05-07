/* pywavegen.cpp
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

#include <boost/python.hpp>
#include <memory>

#include "wavegen.h"

using namespace wavegen;
using namespace boost::python;

static std::shared_ptr<device> global_device;

std::shared_ptr<device> getDevice()
{
    if (!global_device) {
        global_device = std::make_shared<device>();
    }
    return global_device;
}

void freeDevice(std::shared_ptr<device>& dev)
{
    dev.reset();

    if (global_device.use_count() == 1) {
        global_device.reset();
    }
}

BOOST_PYTHON_MODULE(pywavegen)
{
    scope().attr("library_version") = getLibraryVersion();
    class_<
        device,
        std::shared_ptr<device>,
        boost::noncopyable
    >("device", boost::python::no_init)
        .def("__init__", make_constructor(&getDevice))
        .def("__del__", make_function(&freeDevice))
        .def("set_clock_frequency", &device::setClockFrequency)
        .def("set_frequency", &device::setFrequency)
        .def("set_phase", &device::setPhase)
        .def("set_output", &device::setOutput);
    ;
    enum_<output_waveform>("output_waveform")
        .value("sinusoid", output_waveform::sinusoid)
        .value("triangle", output_waveform::triangle)
        .value("square", output_waveform::square)
    ;
};

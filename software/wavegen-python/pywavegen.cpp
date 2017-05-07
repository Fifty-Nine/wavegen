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
#include <boost/python/suite/indexing/vector_indexing_suite.hpp>
#include <memory>

#include "wavegen.h"

using namespace wavegen;
using namespace boost::python;


boost::python::list enumerateAsPyList()
{
    auto devs = enumerateDevices();
    return list { iterator<std::vector<std::string>> { } (devs) };
}

BOOST_PYTHON_MEMBER_FUNCTION_OVERLOADS(device_overloads, setOutput, 1, 2)

BOOST_PYTHON_MODULE(pywavegen)
{
    scope().attr("library_version") = getLibraryVersion();
    def("enumerate_devices", &enumerateAsPyList);
    class_<
        std::vector<std::string>
    >("vector_string")
        .def(vector_indexing_suite<std::vector<std::string>>())
    ;
    class_<
        device,
        std::shared_ptr<device>,
        boost::noncopyable
    >("device", init<>())
        .def(init<std::string>())
        .def("set_clock_frequency", &device::setClockFrequency)
        .def("set_frequency", &device::setFrequency)
        .def("set_phase", &device::setPhase)
        .def("set_output", &device::setOutput, device_overloads());
    ;
    enum_<output_waveform>("output_waveform")
        .value("sinusoid", output_waveform::sinusoid)
        .value("triangle", output_waveform::triangle)
        .value("square", output_waveform::square)
    ;
};

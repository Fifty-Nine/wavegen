cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(FTDI)
find_package(Boost COMPONENTS python)

if (LIBFTDI_FOUND)
	include_directories(${LIBFTDI_INCLUDE_DIR})
	link_directories(${LIBFTDI_LIBRARIES})
else()
    find_package(MPSSE_SPI REQUIRED)
	include_directories(${LIBMPSSE_SPI_INCLUDE_DIR})
	link_directories(${LIBMPSSE_SPI_LIBRARIES})
endif()

add_subdirectory(wavegen)
add_subdirectory(wavegen-test)

if (Boost_PYTHON_FOUND)
    find_package(PythonLibs)

    if (PythonLibs_FOUND)
        include_directories(${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})
        add_subdirectory(wavegen-python)
    endif()
endif()

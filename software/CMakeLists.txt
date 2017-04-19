cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(FTDI REQUIRED)
include_directories(${LIBFTDI_INCLUDE_DIR})

add_subdirectory(wavegen)
add_subdirectory(wavegen-test)

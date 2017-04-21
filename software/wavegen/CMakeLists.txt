cmake_minimum_required(VERSION 3.5)

project(wavegen)

set(wavegen_SOURCE_FILES
    ad9837.cpp
    ad9837.h
    exceptions.h
    packet.cpp
    packet-detail.h
    packet.h
    util.h
    wavegen.cpp
    wavegen.h
)

if (LIBFTDI_FOUND)
    set(wavegen_SOURCE_FILES
        ${wavegen_SOURCE_FILES}
        ft2232h-spi-libftdi.cpp
    )
else()
    set(wavegen_SOURCE_FILES
        ${wavegen_SOURCE_FILES}
        ft2232h-spi-d2xx.cpp
    )
endif()

add_library(wavegen ${wavegen_SOURCE_FILES})

set_target_properties(wavegen
                      PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(wavegen ftdi)

set(wavegen_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}
    CACHE INTERNAL "wavegen: Include Directories" FORCE)

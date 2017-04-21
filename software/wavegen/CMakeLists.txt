cmake_minimum_required(VERSION 3.5)

project(wavegen)

add_library(wavegen
    ad9837.cpp
    ad9837.h
    exceptions.h
    util.h
    wavegen.cpp
    wavegen.h
)

set_target_properties(wavegen
                      PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(wavegen ftdi)

set(wavegen_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}
    CACHE INTERNAL "wavegen: Include Directories" FORCE)

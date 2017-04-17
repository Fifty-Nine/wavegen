cmake_minimum_required(VERSION 3.5)

project(wavegen)

add_library(wavegen wavegen.h util.h wavegen.cpp)

set_target_properties(wavegen
                      PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(wavegen ftdi)

set(wavegen_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}
    CACHE INTERNAL "wavegen: Include Directories" FORCE)

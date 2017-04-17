cmake_minimum_required(VERSION 3.5)

project(wavegen-test)

include_directories(${wavegen_INCLUDE_DIRS})

add_executable(wavegen-test wavegen-test.cpp)

target_link_libraries(wavegen-test wavegen)

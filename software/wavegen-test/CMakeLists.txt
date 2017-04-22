cmake_minimum_required(VERSION 3.5)

project(wavegen-test)

add_executable(wavegen-test wavegen-test.cpp)

target_include_directories(wavegen-test PUBLIC ${wavegen_INCLUDE_DIRS})
target_link_libraries(wavegen-test wavegen)


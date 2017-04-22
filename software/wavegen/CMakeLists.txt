cmake_minimum_required(VERSION 3.5)

project(wavegen)

set(wavegen_PUBLIC_HEADERS
    wavegen.h
)

set(wavegen_PRIVATE_HEADERS
    exceptions.h
    ft2232h-spi.h
)

set(wavegen_SOURCE_FILES
    ad9837.cpp
    packet.cpp
    wavegen.cpp
)

if (LIBFTDI_FOUND)
    set(wavegen_SOURCE_FILES
        ${wavegen_SOURCE_FILES}
        ft2232h-spi-libftdi.cpp
    )
else()
    set(wavegen_SOURCE_FILES
        ${wavegen_SOURCE_FILES}
        ft2232h-spi-libmpsse-spi.cpp
    )
endif()

add_library(wavegen ${wavegen_SOURCE_FILES})

set_target_properties(
    wavegen PROPERTIES
    POSITION_INDEPENDENT_CODE ON
)
set_target_properties(
    wavegen PROPERTIES
    PRIVATE_HEADER "${wavegen_PRIVATE_HEADERS}"
)
set_target_properties(
    wavegen PROPERTIES
    PUBLIC_HEADER "${wavegen_PUBLIC_HEADERS}"
)

install(
    TARGETS wavegen
    EXPORT wavegen
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include
    PRIVATE_HEADER DESTINATION include/wavegen
)
install(EXPORT wavegen NAMESPACE wg_ DESTINATION share/wavegen)

if (LIBFTDI_FOUND)
    target_link_libraries(wavegen ftdi)
else()
	target_link_libraries(wavegen libmpsse)
endif()

set(wavegen_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}
    CACHE INTERNAL "wavegen: Include Directories" FORCE)

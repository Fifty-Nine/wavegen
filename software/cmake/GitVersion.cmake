find_package(Git)

exec_program(
    ${GIT_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ARGS "describe --always"
    OUTPUT_VARIABLE GIT_REVISION
)

add_definitions( -DGIT_REVISION="${GIT_REVISION}" )

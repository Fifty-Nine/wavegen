project(wavegen-python)

python_add_module(pywavegen pywavegen.cpp)

target_include_directories(pywavegen PUBLIC ${wavegen_INCLUDE_DIRS})
target_link_libraries(pywavegen wavegen ${Boost_PYTHON_LIBRARY} ${PYTHON_LIBRARY})

execute_process(
    COMMAND "${PYTHON_EXECUTABLE}" -c "if True:
        from distutils import sysconfig
        print(sysconfig.get_python_lib(prefix='', plat_specific=True))"
    OUTPUT_VARIABLE PYTHON_SITE
    OUTPUT_STRIP_TRAILING_WHITESPACE)

set_target_properties(pywavegen PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${PYTHON_SITE}/pywavegen
    PREFIX ""
)

if (WIN32 AND NOT CYGWIN)
    set_target_properties(pywavegen PROPERTIES SUFFIX .pyd)
endif()

install(TARGETS pywavegen
    RUNTIME DESTINATION ${PYTHON_SITE}/pywavegen
    LIBRARY DESTINATION ${PYTHON_SITE}/pywavegen
)

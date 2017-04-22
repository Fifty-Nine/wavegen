project(wavegen-python)

python_add_module(pywavegen pywavegen.cpp)

target_include_directories(pywavegen PUBLIC ${wavegen_INCLUDE_DIRS})
target_link_libraries(pywavegen wavegen ${Boost_PYTHON_LIBRARY})

cmake_minimum_required(VERSION 3.16)

project(kata)

include(dependencies.cmake)
include(CTest)

add_subdirectory(impl)
add_subdirectory(unittest)

cmake_minimum_required(VERSION 3.16)

project(kata)

include(setup.cmake)

find_package(build_api)
include(me_build_api)

add_subdirectory(impl)
add_subdirectory(unittest)

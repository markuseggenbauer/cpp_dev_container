list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

# Coverage

# if(NOT EXISTS "${CMAKE_BINARY_DIR}/CodeCoverage.cmake") message( STATUS
# "Downloading CodeCoverage.cmake from
# https://raw.githubusercontent.com/bilke/cmake-modules/master/CodeCoverage.cmake"
# ) file( DOWNLOAD
# "https://raw.githubusercontent.com/bilke/cmake-modules/master/CodeCoverage.cmake"
# "${CMAKE_BINARY_DIR}/CodeCoverage.cmake") endif()

# include(CodeCoverage)

# set(CMAKE_CXX_FLAGS_DEBUG ${COVERAGE_COMPILER_FLAGS} CACHE STRING "Flags used
# by the C++ compiler during coverage builds." FORCE) set(CMAKE_C_FLAGS_DEBUG
# ${COVERAGE_COMPILER_FLAGS} CACHE STRING "Flags used by the C compiler during
# coverage builds." FORCE)

# Conan package manager
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(
    DOWNLOAD
    "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
    "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(
  CONANFILE
  conanfile.txt
  BASIC_SETUP
  CMAKE_TARGETS
  NO_OUTPUT_DIRS
  BUILD
  missing)

include(CTest)

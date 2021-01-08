find_package(GTest)

me_add_executable(
  unittest_kata
  SOURCES
  kata.cpp
  DEPENDS
  kata
  GTest::gtest
  GTest::gtest_main)

add_test(unittest_kata unittest_kata)

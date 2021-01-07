find_package(GTest)

me_add_executable_artifact(
  unittest_kata
  SOURCES
  kata.cpp
  DEPENDS
  kata
  GTest::gtest
  GTest::gtest_main)

add_test(unittest_kata unittest_kata)

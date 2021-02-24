find_package(GTest)

me_add_unittest(
    kata
    SOURCES kata.cpp
    SOURCE_DEPENDS GTest::gtest
    CONTAINS GTest::gtest_main
)

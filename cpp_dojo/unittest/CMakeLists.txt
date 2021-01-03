
find_package(GTest)

add_executable(unittest_kata
    kata.cpp
)

target_link_libraries(unittest_kata 
    PRIVATE 
        kata
        GTest::gtest
        GTest::gtest_main
)

add_test(unittest_kata unittest_kata)

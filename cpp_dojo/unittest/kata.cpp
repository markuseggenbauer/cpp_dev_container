#include "gtest/gtest.h"

namespace {
using TestTypeParameters = ::testing::Types<int>;

template <typename T>
class KataTest : public ::testing::Test {};
TYPED_TEST_SUITE_P(KataTest);

TYPED_TEST_P(KataTest, Test1) { EXPECT_TRUE(true); }

TYPED_TEST_P(KataTest, Test2) { EXPECT_TRUE(true); }

REGISTER_TYPED_TEST_SUITE_P(KataTest, Test1, Test2);
INSTANTIATE_TYPED_TEST_SUITE_P(KataTestInstance, KataTest, TestTypeParameters);

}  // namespace

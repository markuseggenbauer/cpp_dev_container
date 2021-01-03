#include "gtest/gtest.h"

namespace {
using TestTypeParameters = ::testing::Types<int>;

template <typename T>
class KataTest : public ::testing::Test {};
TYPED_TEST_SUITE_P(KataTest);

TYPED_TEST_P(KataTest, Test) {
  auto const result = true;
  EXPECT_TRUE(result);
}

REGISTER_TYPED_TEST_SUITE_P(KataTest, Test);
INSTANTIATE_TYPED_TEST_SUITE_P(KataTestInstance, KataTest, TestTypeParameters);

}  // namespace

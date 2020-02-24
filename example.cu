#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include <thrust/device_vector.h>
#include <thrust/transform.h>

TEST_CASE("device lambda test") {
  thrust::device_vector<int> ints(100);
  thrust::transform(thrust::device, ints.begin(), ints.end(), ints.begin(), [] __device__ (int i) { return i+1; });
}

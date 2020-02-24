#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include <thrust/device_vector.h>
#include <thrust/for_each.h>

struct foo {
  int add(int i) { return i + 1; }
};

TEST_CASE("Mutable device lambda test") {
  auto begin = thrust::make_counting_iterator(0);
  auto end = thrust::make_counting_iterator(100);
  thrust::device_vector<int> ints(100);

  foo f;

  thrust::for_each(begin, end, [f] __device__(int i) mutable { f.add(i); });
}

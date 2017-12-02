#include <iostream>
#include <range/v3/all.hpp>
#include "fib_range.hpp"

int main(int argc, const char *argv[])
{
  using namespace ranges;
  auto is_even = [](size_t n) { return n % 2 == 0; };

  fib_range fibs;
  auto acc = accumulate(
      fibs 
      | view::take_while([](size_t n) { return n < 4'000'000;})
      | view::filter(is_even),
      0);

  std::cout << acc << '\n';
  return 0;
}


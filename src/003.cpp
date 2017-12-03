#include <iostream>
#include "prime_range.hpp"
#include <vector>

int main(int argc, const char *argv[])
{
  using namespace ranges;

  size_t n{600851475143};
  size_t s = std::sqrt(n);

  auto is_factor = [n](size_t f) { return n % f == 0; };
  auto potential_factor = [&s](size_t n) { return n < s;};

  auto factors = prime_range() 
    | view::take_while(potential_factor)
    | view::filter(is_factor);

  std::cout << ranges::v3::max(factors) << '\n';
  return 0;
}

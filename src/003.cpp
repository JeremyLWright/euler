#include <iostream>
#include "prime_range.hpp"
#include <vector>

int main(int argc, const char *argv[])
{
  using namespace ranges;

  size_t n{600851475143};

  auto is_factor = [n](size_t f) { return n % f == 0; };

  std::vector<size_t> vs;
  primesieve::generate_primes(std::sqrt(n), &vs);
  size_t max{0};
  for(auto v : vs) {
	  if(is_factor(v)) max = v;
  }
  
  //auto factors = prime_range() 
  //  | view::take_while(potential_factor)
  //  | view::filter(is_factor);

  std::cout << max << '\n';
  return 0;
}

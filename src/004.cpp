#include <iostream>
#include "prime_range.hpp"
#include <set>

int main(int argc, const char *argv[])
{
  using namespace ranges;

  std::set<size_t> palindromes;

  auto is_palindrome = [](size_t x){ 
    auto x_str = std::to_string(x);
    std::string reverse_x = x_str;
    std::reverse(reverse_x.begin(), reverse_x.end());
    return x_str == reverse_x;
  };

  for(size_t y = 100; y < 999; ++y) {
    for(size_t z = y; z < 999; ++z) {
      auto x = y + z;
      if(is_palindrome(x)) palindromes.insert(x);
    }
  }

  std::cout << ranges::v3::max(palindromes) << '\n';

  //std::cout << ranges::v3::max(factors) << '\n';
  return 0;
}

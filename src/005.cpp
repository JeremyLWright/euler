#include <iostream>
#include <boost/math/common_factor_rt.hpp>
#include <range/v3/all.hpp>
#include <vector>


template <typename Cnt, typename Fn>
auto foldr1(Cnt c, Fn f) {
  auto fac_itr = std::rbegin(c);
  auto a = *fac_itr;
  auto b = *(++fac_itr);
  auto result = f(a, b);
  for(
      ;
      fac_itr != std::rend(c);
      ++fac_itr)
  {
    result = f(result, *fac_itr);
  }
  return result;
}


int main(int argc, const char *argv[])
{
  std::vector<size_t> v = ranges::view::ints(1, 20);
  auto f = [](size_t a, size_t b){ return boost::math::lcm(a, b); };
  auto result = foldr1(v, f);

  std::cout << result << '\n';

  return 0;
}

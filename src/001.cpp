#include <algorithm>
#include <functional>
#include <iostream>
#include <iterator>
#include <vector>

bool isDivisible(int const num, int const divisor) {
  return num % divisor == 0; 
}


int main(int argc, const char *argv[])
{
  size_t acc{0};
  for(int i = 0; i < 1000; ++i) {
    if(isDivisible(i, 3) || isDivisible(i, 5)) acc += i;
  }
  std::cout << acc << '\n';
  return 0;
}

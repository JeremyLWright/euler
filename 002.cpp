
#include <iostream>
#include <algorithm>
#include <iterator>

int fib(int a, int b) {
  return a + b;
}

int main(int argc, const char *argv[])
{
  size_t first = 1
  size_t second = 2;
  auto n{first + second};
  size_t acc{0};
  for(int i = 3; n < 4'0; ++i) {
    std::cout << n << '\n';
    n = second + n;
    if(n%2 == 0) acc += n;
  }
  std::cout << acc << '\n';
//
//
//  1 + 2 = 3
//    2 + 3 = 5
//      3 + 5 = 8
//    
//  
  return 0;
}


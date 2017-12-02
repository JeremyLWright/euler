#include <iostream>
#include <algorithm>
#include <iterator>

int main(int argc, const char *argv[])
{
  size_t a = 0;
  size_t b = 1;
  size_t nextTerm = 0;

  size_t acc = 0;

  while(nextTerm < 4'000'000) {
    nextTerm = a + b;
    a = b;
    b = nextTerm;
    if(nextTerm % 2 == 0) acc += nextTerm;
  }

  std::cout << acc << '\n';
  return 0;
}


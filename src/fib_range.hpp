#pragma once

#include <range/v3/all.hpp>

class fib_range : public ranges::view_facade<fib_range>
{
  friend ranges::range_access;
  
  size_t a = 0;
  size_t b = 1;
  size_t nextTerm = 0;

  size_t const & read() const { return nextTerm; }
  bool equal(ranges::default_sentinel) const { return false; }
  void next() { 
    nextTerm = a + b;
    a = b;
    b = nextTerm;
  }

  public:
  fib_range() = default;
};

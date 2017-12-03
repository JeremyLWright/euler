#pragma once

#include <range/v3/all.hpp>
#include <primesieve.hpp>

class prime_range : public ranges::view_facade<prime_range>
{
  friend ranges::range_access;

  primesieve::iterator it;
  size_t prime{it.next_prime()};

  size_t const & read() const { return prime; }
  bool equal(ranges::default_sentinel) const { return false; }
  void next() { 
    prime = it.next_prime();
  }

  public:
  prime_range() = default;
};

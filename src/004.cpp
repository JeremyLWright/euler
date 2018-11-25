#include <iostream>
#include <algorithm>
#include <utility>
#include <map>
#include <functional>

auto is_palindrome(std::string const & x) { 
	std::string reverse_x = x;
	std::reverse(reverse_x.begin(), reverse_x.end());
	return x == reverse_x;
}

auto is_palindrome(size_t x) { 
	return is_palindrome(std::to_string(x));
}

bool memo(std::function<bool(size_t)> fn, size_t x) {
	static std::map<size_t, size_t> cache;
	auto it = cache.find(x);
	if(it == std::end(cache)) {
		auto result = fn(x);
		cache.insert(std::make_pair(x, result));
		return result;
	} else {
		return it->second;
	}

}

int main(int argc, const char *argv[])
{
  size_t max_palindrome{0};
  for(size_t y = 100; y < 999; ++y) {
    for(size_t z = y; z < 999; ++z) {
      auto x = y * z;
      if(is_palindrome(x)) {
		  max_palindrome = x > max_palindrome ? x : max_palindrome;
	  }
    }
  }

  std::cout << max_palindrome << '\n';
  return 0;
}

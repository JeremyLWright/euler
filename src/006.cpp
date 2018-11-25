#include <algorithm>
#include <cmath>
#include <vector>
#include <iterator>
#include <iostream>
#include <numeric>

size_t sum_squares(size_t n) {
	//Closed form of sum of natural numbers 1 -> n
	// n(n+1)/2
	return std::pow(n * (n + 1) / 2, 2);
}

size_t square_sums(size_t n) {

	size_t sum{0};
	for(size_t i{1}; i <= n; ++i) {
		sum += std::pow(i, 2);
	}
	return sum;
}

int main(int argc, const char *argv[])
{
	std::cout << sum_squares(100) - square_sums(100) << '\n';	
	return 0;
}

#include <primesieve.hpp>
#include <iostream>

int main(int argc, const char *argv[])
{
	std::cout << primesieve::nth_prime(10001) << '\n';
	
	return 0;
}

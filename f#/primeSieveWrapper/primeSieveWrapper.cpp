#include "primeSieveWrapper.h"

#include "..\primeSieve\include\primesieve.h"

uint64_t* primesieve_generate_primes(uint64_t start, uint64_t stop)
{
	size_t s{0};
	auto primes = primesieve_generate_primes(start, stop, &s, UINT64_PRIMES);
	return &s;
}
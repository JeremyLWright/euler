#pragma once

#include <cstdint>


#if defined PRIMESIEVE_EXPORTS
#define PRIMESIEVE_EXPORT __declspec(dllexport)
#else
#define PRIMESIEVE_EXPORT __declspec(dllimport)
#endif

namespace NativePrimes
{
public ref class NativePrimes
{
public:
	static bool toggle(bool g) { return !g; }
	static uint64_t% primesieve_generate_primes2(uint64_t start, uint64_t stop, [System::Runtime::InteropServices::Out] size_t% size);
};
}

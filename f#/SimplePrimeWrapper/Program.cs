using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NativePrimes;

namespace SimplePrimeWrapper
{
    class Program
    {
        static void Main(string[] args)
        {
            //PRIMESIEVE_EXPORT uint64_t* primesieve_generate_primes(uint64_t start, uint64_t stop, size_t* size);

            ulong h;
            var g = NativePrimes.NativePrimes.primesieve_generate_primes2(10, 15, out h);
            Console.WriteLine($"Got {g} and {h}.");

        }
    }
}

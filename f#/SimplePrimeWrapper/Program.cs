using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;

public class PrimeSieve
{
    [DllImport("primesieve.dll")]
    public static extern int primesieve_test();

    [DllImport("primesieve.dll")]
    public static extern IntPtr primesieve_generate_n_primes(UInt64 n, UInt64 start, int a);

    public static int[] generate(UInt64 n, UInt64 start)
    {
        int[] ReturnArray = new int[n];
        IntPtr d = primesieve_generate_n_primes(n, start, 2);
        Marshal.Copy(d, ReturnArray, (int)0, (int)n);
        return ReturnArray;
    }
}


namespace SimplePrimeWrapper
{
    class Program
    {
        static void Main(string[] args)
        {
            var h = PrimeSieve.generate(1000000, 0);
            //PRIMESIEVE_EXPORT uint64_t* primesieve_generate_primes(uint64_t start, uint64_t stop, size_t* size);

            //ulong h;
            //var g = NativePrimes.NativePrimes.primesieve_generate_primes2(10, 15, out h);
            //Console.WriteLine($"Got {g} and {h}.");
            Console.WriteLine($"Testing Primes {PrimeSieve.primesieve_test()}");

        }
    }
}

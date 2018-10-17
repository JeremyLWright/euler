import Criterion.Main
import Euler.ONeillPrimes
import Data.Numbers.Primes

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main = defaultMain [
  bgroup "Baselines" [
	bench "primes <1E1" $ whnf primesToLimit 10
	, bench "primes <1E2" $ whnf primesToLimit 100
	, bench "primes <1E3" $ whnf primesToLimit 1000
	, bench "primes <1E4" $ whnf primesToLimit 10000
	, bench "primes <1E5" $ whnf primesToLimit 100000
	, bench "primes <1E6" $ whnf primesToLimit 1000000
	, bench "primes <1E7" $ whnf primesToLimit 10000000
	, bench "primes <1E8" $ whnf primesToLimit 100000000
	, bench "primes <1E9" $ whnf primesToLimit 1000000000
	] ]

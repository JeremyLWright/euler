import Criterion.Main
--import Euler.ONeillPrimes
import Data.Numbers.Primes

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main = defaultMain [
        bgroup "Baselines" [
        --bench "fib 10"      $ \n -> fib (10+n-n)
        --bench "primes <1E1" $ B primesToLimit 10
        -- bench "fib" $ nf fib 10
        --bench "primes" $ nf primesToLimit 10
        --, bench "primes <1E2" $ nf (primesToLimit 100)
        --, bench "primes <1E3" $ nf (primesToLimit 1000)
        --, bench "primes <1E4" $ nf (primesToLimit 10000)
        --, bench "primes <1E5" $ nf (primesToLimit 100000)
        --, bench "primes <1E6" $ nf (primesToLimit 1000000)
        --, bench "primes <1E7" $ nf (primesToLimit 10000000)
        --, bench "primes <1E8" $ nf (primesToLimit 100000000)
        --, bench "primes <1E9" $ nf (primesToLimit 1000000000)
        ] ]

import Criterion.Main
import Euler.ONeillPrimes

p = last $ takeWhile (<10000000) primes

w f = f

main = defaultMain [
        bgroup "Baselines" [
        bench "primes <1E6" $ nf seq p
        ] ]

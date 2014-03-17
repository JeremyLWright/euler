import Euler.Combinatorics
import Euler.NumberTheory


circularPrimes :: [Integer] -> [Integer]
circularPrimes []     = []
circularPrimes (x:xs)
    | all isPrime p = x :  circularPrimes xs
    | otherwise     = circularPrimes xs
    where
        p = permutations x

prob035 :: Int
prob035 = length $ circularPrimes $ takeWhile (<1000000) primes

main = print prob035

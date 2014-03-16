import Euler.Combinatorics
import Euler.NumberTheory


circular_primes :: [Integer] -> [Integer]
circular_primes []     = []
circular_primes (x:xs)
    | all isPrime p = x :  circular_primes xs
    | otherwise     = circular_primes xs
    where
        p = permutations x

prob_35 :: Int
prob_35 = length $ circular_primes $ takeWhile (<1000000) primes

main = print prob_35

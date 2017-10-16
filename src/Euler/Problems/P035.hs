module Euler.Problems.P035 (prob035) where
import Euler.Combinatorics
import Euler.NumberTheory

circular_primes :: [Integer] -> [Integer]
circular_primes []     = []
circular_primes (x:xs)
    | all isPrime p = x :  circular_primes xs
    | otherwise     = circular_primes xs
    where
        p = rotations x

prob035 :: Int
prob035 = length $ circular_primes $ takeWhile (<1000000) primes


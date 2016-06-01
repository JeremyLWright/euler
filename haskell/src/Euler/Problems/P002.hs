module Euler.Problems.P002 (prob002) where

-- generate a power of 2 sequence
-- unfoldr (\z -> Just (z, 2*z)) 1

-- unfoldr (\(f1, f2) -> Just (f1, (f2, f1+f2)) ) (0,1)
--fibs = 0:1:zipWith (+) fibs (tail fibs)
--fib = 0:scanl (+) 1 fib


prob002 = (sum [ x | x <- takeWhile (<= 4000000) fibs, even x])
    where fibs = 0:scanl (+) 1 fibs

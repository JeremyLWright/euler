module Euler.Problems.P025 (prob025) where

fibs = 1:1:(zipWith (+) fibs (tail fibs))

fibPairs = zip [1..] fibs

fibLength l = [(a,b) | (a,b) <- fibPairs, b > 10^(l-1)]

prob025 = fst $ (take 1 $ fibLength 1000) !! 0

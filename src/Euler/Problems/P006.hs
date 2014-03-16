module Euler.Problems.P006 (prob006) where

sumSquares a = sum [1..a] ^ 2

squareSums a = sum (map (^2) [1..a])

prob006 = (sumSquares 100 - squareSums 100) 

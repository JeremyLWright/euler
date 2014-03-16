module Euler.Problems.P001 (prob001) where

prob001 = (sum [ x | x <- [0..1000-1], rem x 3 == 0 || rem x 5 == 0]) 


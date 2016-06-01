module Euler.Problems.P024 (prob024) where
import Data.List


prob24 xs = sort $ permutations xs

prob024 = prob24 "0123456789" !! (1000000-1)

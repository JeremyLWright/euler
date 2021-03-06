module Euler.Problems.P021 (prob021) where

import Euler.NumberTheory

amicable_pair n | n == d n = False
                | n == (d . d) n = True
                | otherwise = False

d n = sum $ properdivisors n

prob021 = (sum $ filter amicable_pair [1..10000])
          


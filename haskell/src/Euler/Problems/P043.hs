module Euler.Problems.P043 (prob043) where
import Euler.Combinatorics



pandigitals = permutations 1234567890

-- Select indexes 2,3,4 from a 9 digit number 
-- 1 2 3 4 5 6 7 8 9
d234 n = (n `div` 1000000) `mod` 1000
d345 n = (n `div` 100000) `mod` 1000
d456 n = (n `div` 10000) `mod` 1000
d567 n = (n `div` 1000) `mod` 1000
d678 n = (n `div` 100) `mod` 1000
d789 n = (n `div` 10) `mod` 1000
d890 n = (n `div` 1) `mod` 1000

prob043 = sum [ n | n <- pandigitals,
              (d234 n) `mod` 2 == 0,
              (d345 n) `mod` 3 == 0,
              (d456 n) `mod` 5 == 0,
              (d567 n) `mod` 7 == 0,
              (d678 n) `mod` 11 == 0,
              (d789 n) `mod` 13 == 0,
              (d890 n) `mod` 17 == 0]


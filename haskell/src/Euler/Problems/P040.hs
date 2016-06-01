module Euler.Problems.P040 (prob040) where


import Data.Char

champernownes_constant = concat $ map show ns
    where
        ns = [1,2..]


prob040 = product $ map digitToInt [champernownes_constant !! (1-1), champernownes_constant !! (10-1), champernownes_constant !! (100-1), champernownes_constant !! (1000-1), champernownes_constant !! (10000-1), champernownes_constant !! (100000-1), champernownes_constant !! (1000000-1)]

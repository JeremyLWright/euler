module Euler.Problems.P020 (prob020) where

import Data.Char

factorial n | n == 0 = 1
            | otherwise = n * factorial (n - 1)

prob020 = (sum $ map digitToInt $ show $ factorial 100)



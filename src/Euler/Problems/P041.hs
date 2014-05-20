module Euler.Problems.P041 (prob041) where

import Euler.ONeillPrimes
import Euler.NumberProperties
import Euler.NumberTheory
import Data.Char (intToDigit)
import Data.List

prob041 = maximum [ n' | d <- [3..9], n <- permute ['1'..intToDigit d],
                            let n' = read n, isPrime n']
    where
        permute "" = [""]
        permute str = [(x:xs)| x <- str, xs <- permute (delete x str)]



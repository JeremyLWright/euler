import Euler.ONeillPrimes
import Euler.NumberProperties
import Euler.NumberTheory
import Data.Char (intToDigit)
import Data.List

problem_41 = maximum [ n' | d <- [3..9], n <- permute ['1'..intToDigit d],
                            let n' = read n, isPrime n']
    where
        permute "" = [""]
        permute str = [(x:xs)| x <- str, xs <- permute (delete x str)]

main = print problem_41

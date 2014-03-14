---Using the fact that only prime digits can appear on the leftmost or rightmost--and only odd digits (minus 5) can appear in the middle.

import Data.Numbers.Primes (isPrime)
import Control.Monad (liftM2)
import Data.List (inits)

primeDigits= "2357"

fillerDigits = "1379"

findTruncatablePrimes = map read $ recur [] [""]
  where recur acc cur = let cur' = filter (isPrime . read) $ liftM2 (:) fillerDigits cur
                            new  = filter (all (isPrime . read) . tail . inits) $ liftM2 (:) primeDigits cur
                        in if null cur'
                           then acc
                           else recur (acc ++ new) cur'

prob037 = sum $ drop  (length primeDigits) findTruncatablePrimes

main = print prob037

import Euler.NumberTheory
import Data.Digits

reverseNum =  unDigits 10 . digitsRev 10

leftToRightPrime 0 = True
leftToRightPrime x  | isPrime x = leftToRightPrime $ x `div` 10
                    | otherwise = False

rightToLeftPrime x = leftToRightPrime $ reverseNum x

--2,3,5,7 are dropped from the result
--prob037 = take 11 $ drop 4 $ filter rightToLeftPrime $ filter leftToRightPrime primes
prob037 = take 11 $ drop 4 $ [x | x <- primes, leftToRightPrime x, rightToLeftPrime x]

main = print prob037

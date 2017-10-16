-- Print out the nth prime, where n is the 1st argument

module Main where

import NaurPrimes (primes)
import System.Environment (getArgs)

printNthPrime :: Int -> IO ()
printNthPrime n = print (n, (primes !! (n - 1)) :: Integer) 

main = do
    args <- getArgs
    printNthPrime $ read $ head args
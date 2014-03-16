module Euler.Problems.P007 (prob007) where

--By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

--What is the 10 001st prime number?
--Answer: 104743

import Euler.ONeillPrimes
import Euler.NumberTheory


prob007 = primes !! (10001-1)

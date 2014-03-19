module Euler.Problems.P032 (prob032) where
import Euler.NumberProperties

prob032 = sum $ nub' pandigitalProds 
    where
        pandigitalProds = [a*b | a <- [2..100], b<-[123..10000`div`(a+1)], isPandigital [a, b, a*b]]


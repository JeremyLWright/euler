import Euler.NumberProperties

prob_32 = sum $ nub' pandigitalProds 
    where
        pandigitalProds = [a*b | a <- [2..100], b<-[123..10000`div`(a+1)], isPandigital [a, b, a*b]]

main = print prob_32

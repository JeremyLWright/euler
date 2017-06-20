package com.codestrokes



//primeFactors n = factor n primes
//where
//factor n (p:ps)
//| p*p > n           = [n]
//| n `mod` p == 0    = p: factor (n `div` p) (p:ps)
//| otherwise         = factor n ps

fun primeFactors( n : Int, primes : Int ) : IntArray =
    intArrayOf(2,3,5)

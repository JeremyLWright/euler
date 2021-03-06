module Euler.Problems.P004 (prob004) where


-- Largest Palindrome product
--A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
--Find the largest palindrome made from the product of two 3-digit numbers.
--Answer 906609

prob004 =
  maximum [x | y<-[100..999], z<-[y..999], let x=y*z, let s=show x, s==reverse s]


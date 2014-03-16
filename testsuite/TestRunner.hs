module Main (
    main
    ) where

import Test.Framework
import Test.Framework.Providers.QuickCheck2
import Test.Framework.Providers.HUnit
import Euler.Problems
import Test.HUnit
import Data.Char

main :: IO()
main = defaultMain [
  testGroup "(Problems)" [
        testCase "Problem 001" (prob001 @=? 233168),
        testCase "Problem 002" (prob002 @=? 4613732),
        testCase "Problem 003" (prob003 @=? 6857),
        testCase "Problem 004" (prob004 @=? 906609),
        testCase "Problem 005" (prob001 @=? 232792560),
        testCase "Problem 006" (prob001 @=? 25164150),
        testCase "Problem 007" (prob001 @=? 104743),
        testCase "Problem 008" (prob001 @=? 40824),
        testCase "Problem 009" (prob001 @=? 31875000),
        testCase "Problem 010" (prob001 @=? 142913828922),
        testCase "Problem 011" (prob001 @=? 70600674),
        testCase "Problem 012" (prob001 @=? 76576500),
        testCase "Problem 013" (prob001 @=? 5537376230),
        --testCase "Problem 014" (prob001 @=? (525),837799),
        testCase "Problem 015" (prob001 @=? 137846528820),
        testCase "Problem 016" (prob001 @=? 1366),
        testCase "Problem 017" (prob001 @=? 21124),
        testCase "Problem 018" (prob001 @=? 1074),
        testCase "Problem 019" (prob001 @=? 171),
        testCase "Problem 020" (prob001 @=? 648),
        testCase "Problem 021" (prob001 @=? 31626),
        testCase "Problem 022" (prob001 @=? 871198282),
        testCase "Problem 023" (prob001 @=? 4179871),
        --testCase "Problem 024" (prob001 @=? "2783915460"),
        testCase "Problem 025" (prob001 @=? 4782),
        testCase "Problem 026" (prob001 @=? 983),
        testCase "Problem 027" (prob001 @=? -59231),
        testCase "Problem 028" (prob001 @=? 669171001),
        testCase "Problem 029" (prob001 @=? 9183),
        testCase "Problem 030" (prob001 @=? 443839),
        testCase "Problem 031" (prob001 @=? 73682),
        testCase "Problem 032" (prob001 @=? 45228),
        testCase "Problem 033" (prob001 @=? 100),
        testCase "Problem 034" (prob001 @=? 40730),
        testCase "Problem 035" (prob001 @=? 55),
        testCase "Problem 036" (prob001 @=? 872187),
        testCase "Problem 037" (prob001 @=? 748317),
        testCase "Problem 038" (prob001 @=? 932718654),
        testCase "Problem 039" (prob039 @=? 840)
        --testCase "Problem 046" (prob001 @=? "working..."),
        --testCase "Problem 096" (prob001 @=? "Hello")
     ]
  ]

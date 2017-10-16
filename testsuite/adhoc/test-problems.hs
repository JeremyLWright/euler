module Main (
    main
    ) where

import Test.Framework
import Test.Framework.Providers.QuickCheck2
import Test.Framework.Providers.HUnit
import Euler.Problems
import Test.HUnit
import Data.Char

import Euler.NumberProperties

main :: IO()
main = defaultMain [
  testGroup "(Problems)" [
        testCase "Problem 001" (prob001 @=? 233168),
        testCase "Problem 002" (prob002 @=? 4613732),
        testCase "Problem 003" (prob003 @=? 6857),
        testCase "Problem 004" (prob004 @=? 906609),
        testCase "Problem 005" (prob005 @=? 232792560),
        testCase "Problem 006" (prob006 @=? 25164150),
        testCase "Problem 007" (prob007 @=? 104743),
        --testCase "Problem 008" (prob008 @=? 40824),
        testCase "Problem 009" (prob009 @=? 31875000),
        testCase "Problem 010" (prob010 @=? 142913828922),
        --testCase "Problem 011" (prob011 @=? 70600674),
        testCase "Problem 012" (prob012 @=? 76576500),
        testCase "Problem 013" (prob013 @=? 5537376230),
        --testCase "Problem 014" (prob001 @=? (525),837799),
        testCase "Problem 015" (prob015 @=? 137846528820),
        testCase "Problem 016" (prob016 @=? 1366),
        testCase "Problem 017" (prob017 @=? 21124),
        testCase "Problem 018" (prob018 @=? 1074),
        testCase "Problem 019" (prob019 @=? 171),
        testCase "Problem 020" (prob020 @=? 648),
        testCase "Problem 021" (prob021 @=? 31626),
        --testCase "Problem 022" (prob022 @=? 871198282),
        testCase "Problem 023" (prob023 @=? 4179871),
        --testCase "Problem 024" (prob001 @=? "2783915460"),
        testCase "Problem 025" (prob025 @=? 4782),
        testCase "Problem 026" (prob026 @=? 983),
        testCase "Problem 027" (prob027 @=? -59231),
        testCase "Problem 028" (prob028 @=? 669171001),
        testCase "Problem 029" (prob029 @=? 9183),
        --testCase "Problem 030" (prob030 @=? 443839),
        testCase "Problem 031" (prob031 @=? 73682),
        testCase "Problem 032" (prob032 @=? 45228),
        testCase "Problem 033" (prob033 @=? 100),
        testCase "Problem 034" (prob034 @=? 40730),
        testCase "Problem 035" (prob035 @=? 55),
        testCase "Problem 036" (prob036 @=? 872187),
        testCase "Problem 037" (prob037 @=? 748317),
        testCase "Problem 038" (prob038 @=? 932718654),
        testCase "Problem 039" (prob039 @=? 840),
        testCase "Problem 040" (prob040 @=? 210),
        testCase "Problem 041" (prob041 @=? 7652413),
        testCase "Problem 043" (prob043 @=? 16695334890),
        --testCase "Problem 044" (prob044 @=? ),
        testCase "Problem 045" (prob045 @=? 1533776805),
        --testCase "Problem 046" (prob046 @=? ),
        --testCase "Problem 047" (prob047 @=? ),
        testCase "Problem 048" (prob048 @=? 9110846700),
        testCase "Problem 056" (prob056 @=? 972)
     ]
  ]

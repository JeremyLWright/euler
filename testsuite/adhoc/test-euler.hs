module Main (
    main
    ) where

import Test.Framework
import Test.Framework.Providers.QuickCheck2
import Test.Framework.Providers.HUnit
import Test.HUnit
import Data.Char

import Euler.NumberProperties

main :: IO()
main = defaultMain [
  testGroup "(NumberTheory)" [
        testCase "pandigital 1" (True @=? isPandigital 1),
        testCase "pandigital 12" (True @=? isPandigital 12),
        testCase "pandigital 123" (True @=? isPandigital 123),
        testCase "pandigital 1234" (True @=? isPandigital 1234),
        testCase "pandigital 12345" (True @=? isPandigital 12345),
        testCase "pandigital 123456" (True @=? isPandigital 123456),
        testCase "pandigital 1234567" (True @=? isPandigital 1234567),
        testCase "pandigital 12345678" (True @=? isPandigital 12345678),
        testCase "pandigital 123456789" (True @=? isPandigital 123456789),

        testCase "digs"         ([1,2,3] @=? digs 123)
     ]
  ]
  -- try this: permutations $ digs 123456789

--module Main (
--    main
--    ) where

--import Test.Framework
--import Test.Framework.Providers.QuickCheck2
--import Test.Framework.Providers.HUnit
import Euler.Problems
import Test.HUnit

--main :: IO()
--main = defaultMain tests



test039 = TestCase (assertEqual "Something" 840 prob039)

tests :: [Test]
tests = TestList [test039]

main = runTestTT  [test039]

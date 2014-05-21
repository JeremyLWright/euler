{-# LANGUAGE TemplateHaskell #-}
import Euler.NumberTheory
import Test.QuickCheck
import Test.QuickCheck.All


newtype Prime = Prime Integer deriving Show

instance Arbitrary Prime where
    arbitrary = do i <- arbitrary 
                   return $ Prime (primes!!(abs i))

--prop_primes_dont_divide (Prime x) (Prime y) = x == y || x `mod` y > 0
prop_primes_are_odd (Prime p) | p == 2 = True
                              | otherwise = odd p

--tests = [("prime_simple_trial_division"), test prop_primes_dont_divide]

main = $(verboseCheckAll)
--main = $(quickCheckAll)

module Euler.Problems.P029 (prob029) where
import Data.Set

nums = [a^b | a <- [2..100], b <- [2..100]]

prob029 = (size . fromList $ nums)


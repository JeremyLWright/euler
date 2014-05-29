module Euler.Problems.P056 (prob056) where
import Euler.NumberProperties
p = [a^b | a <- [1..99], b <- [1..99]]

prob056 = maximum $ map sum $ map digs p

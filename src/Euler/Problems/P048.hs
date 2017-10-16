
module Euler.Problems.P048 (prob048) where
import Euler.NumberProperties

prob048 = fromDigits $ reverse $ take 10 $ reverse $ digs $ sum [x^x | x <- [1..1000]]


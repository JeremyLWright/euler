module Euler.Problems.P030 (prob030) where
import Data.Char

checkfifthSum n = powerSum == n
    where powerSum = sum $ map (^5) $  map digitToInt $ show n

fifthSums = filter checkfifthSum [2..limit]
    where limit = (sum . map (9^5*)) [1..5]

prob030 = print $ sum fifthSums

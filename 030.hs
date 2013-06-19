import Data.Char

checkfifthSum n = powerSum == n
    where powerSum = sum $ map (^5) $  map digitToInt $ show n

fifthSums = filter checkfifthSum [1..limit]
    where limit = (sum . map (9^5*)) [1..5]

main = print $ sum fifthSums

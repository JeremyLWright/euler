import Data.Char

checkfifthSum n = powerSum == n
    where powerSum = sum $ map ((^5) . digitToInt) (show n)

fifthSums = filter checkfifthSum [2..limit]
    where limit = (sum . map (9^5*)) [1..5]

main :: IO()
main = print $ sum fifthSums

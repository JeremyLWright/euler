import Data.Char

factorial n | n == 0 = 1
            | otherwise = n * factorial (n - 1)

main :: IO()
main = print (sum $ map digitToInt $ show $ factorial 100)



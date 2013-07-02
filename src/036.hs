import Data.Digits
import Data.Char


isPalindrome s = s == reverse s

intToList n = (map (digitToInt)) $ show n

convertBase :: Integral a => a -> a -> [a] -> [a]
convertBase from to = digits to . unDigits from

decToBin :: [Int] -> [Int]
decToBin = convertBase 10 2

prob36 = sum [x | x <- [1,3..1000000], binPal x, decPal x] -- even numbers require a leading 0 in binary to be palindromic
    where 
        binPal n = isPalindrome $ decToBin $ intToList n
        decPal n = isPalindrome $ intToList n

main = print prob36


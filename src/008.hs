--Find the greatest product of five consecutive digits in the 1000-digit number.
--Answer: 40824

import Data.Char (digitToInt)
import Data.List (tails)
 
prob008 = do str <- readFile "Data/008.txt"
             let number = map digitToInt (concat $ lines str) --take the 
             print $ maximum $ map (product . take 5) (tails number)

main :: IO()
main = prob008


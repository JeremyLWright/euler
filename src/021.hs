import Euler.NumberTheory

amicablePair n | n == d n = False
                | n == (d . d) n = True
                | otherwise = False

d n = sum $ properdivisors n

main :: IO()
main = print (sum $ filter amicablePair [1..10000])
          


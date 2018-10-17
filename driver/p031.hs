import Euler.Combinatorics

coins = [1,2,5,10,20,50,100,200]

main :: IO()
main = print $ linearCombinations 200 (length coins) coins

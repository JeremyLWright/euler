import Data.List


prob24 xs = sort $ permutations xs

main :: IO()
main = print $ prob24 "0123456789" !! (1000000-1)

import Data.Set

nums = [a^b | a <- [2..100], b <- [2..100]]

main :: IO()
main = print (size . fromList $ nums)


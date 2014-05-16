module Euler.NumberProperties (isPandigital, isPandigitalList, nub', digs, fromDigits ) where
import Data.List

import Data.Bits
import qualified Data.Set as S
nub' :: (Ord a) => [a] -> [a]
nub' = go S.empty
  where go _ [] = []
        go s (x:xs) | S.member x s = go s xs
                    | otherwise    = x : go (S.insert x s) xs

isPandigital :: Integer -> Bool
isPandigital x = 
    let (y, flag) = foldr 
                    (\_ (x, flag) -> (x `div` 10, flag .|. 2 ^ (x `mod` 10)))
                    (x `mod` 1000000000, 0::Int) [1..9]
    in 1022 == flag

--isPandigital :: [(Int, Int, Int)]
--isPandigital = [(a, b, a+b) | a <- d3, b <- d3, b > a, a+b > 999, unique [a, b, a+b]]
--    where d3 = filter (unique . return) [100..999]
--          unique = (\x -> x == nub x) . (show =<<)

--isPandigital :: Integer -> Bool
--isPandigital n = sort ( foldl1 (++) convert) == "123456789" 
--    where 
--        convert = map show $ digs n

isPandigitalList ns = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show ns

--isPandigital :: [Int] -> Bool
--isPandigital ns = isPandigital $ fromDigits ns

digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

fromDigits = foldl ((+).(*10)) 0

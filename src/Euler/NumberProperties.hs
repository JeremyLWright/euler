module Euler.NumberProperties (isPandigital, isPandigital0, isPandigitalList, nub', digs, fromDigits) where
import Data.List
import Debug.Trace
import Data.Bits
import qualified Data.Set as S
nub' :: (Ord a) => [a] -> [a]
nub' = go S.empty
  where go _ [] = []
        go s (x:xs) | S.member x s = go s xs
                    | otherwise    = x : go (S.insert x s) xs



isPandigital :: Integer -> Bool
isPandigital x = helper xs [1,2,3,4,5,6,7,8,9] (length xs)
    where
        xs = digs x
        helper (x:xs) ps n = case find (==x) ps of
                                Just a -> helper xs (delete a ps) n
                                Nothing -> False
        helper [] ps n = 9 - (length ps) - n == 0

isPandigital0 :: Integer -> Bool
isPandigital0 x = helper xs [0, 1,2,3,4,5,6,7,8,9] (length xs)
    where
        xs = digs x
        helper (x:xs) ps n = case find (==x) ps of
                                Just a -> helper xs (delete a ps) n
                                Nothing -> False
        helper [] ps n = 10 - (length ps) - n == 0
--helper working_niumber possibles original_length = 
                 
--isPandigital : : Integer -> Bool
--isPandigital x  = 
--    let (y, fl ag) = foldr 
--                    (\_ (x, flag) -> (x `div` 10, flag .|. 2 ^ (x `mod` 10)))
--                    (x `mod` 1000000000, 0::Int) [1..9]
--    in 1022 == flag

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

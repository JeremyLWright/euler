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

isPandigitalList ns = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show ns

digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

fromDigits = foldl ((+).(*10)) 0

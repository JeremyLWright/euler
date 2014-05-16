module Euler.NumberProperties (isPandigital, isPandigitalList, nub', digs, fromDigits ) where
import Data.List

import qualified Data.Set as S
nub' :: (Ord a) => [a] -> [a]
nub' = go S.empty
  where go _ [] = []
        go s (x:xs) | S.member x s = go s xs
                    | otherwise    = x : go (S.insert x s) xs

isPandigital :: Integer -> Bool
isPandigital n = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show $ digs n

isPandigitalList ns = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show ns

--isPandigital :: [Int] -> Bool
--isPandigital ns = isPandigital $ fromDigits ns

digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

fromDigits = foldl ((+).(*10)) 0

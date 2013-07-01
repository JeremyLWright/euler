module Euler.NumberProperties (isPandigital, nub') where
import Data.List

import qualified Data.Set as S
nub' :: (Ord a) => [a] -> [a]
nub' = go S.empty
  where go _ [] = []
        go s (x:xs) | S.member x s = go s xs
                    | otherwise    = x : go (S.insert x s) xs

isPandigital xs = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show xs
        

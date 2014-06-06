module Euler.Combinatorics (linearCombinations, Euler.Combinatorics.permutations, rotations) where
import Data.List as L
import Euler.NumberProperties
linearCombinations 0 _ _ = 1
linearCombinations n m ns | n < 0 = 0
          | m <= 0 && n >= 1 = 0
                    | otherwise = linearCombinations n (m-1) ns + linearCombinations (n - ns!!(m-1)) m ns

permutations :: Integer -> [Integer]
permutations n = map fromDigits $ L.permutations $ digs n
 
rotations :: Integer -> [Integer]
rotations n = take l $ map (read . take l) $ L.tails $ take (2*l -1) $ cycle s
    where
        s = show n
        l = length s
        

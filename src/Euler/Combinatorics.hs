module Euler.Combinatorics (linear_combinations, permutations) where
import Data.List (tails, (\\))

linear_combinations 0 _ _ = 1
linear_combinations n m ns | n < 0 = 0
          | m <= 0 && n >= 1 = 0
                    | otherwise = linear_combinations n (m-1) ns + linear_combinations (n - ns!!(m-1)) m ns

permutations :: Integer -> [Integer]
permutations n = take l $ map (read . take l) $ tails $ take (2*l -1) $ cycle s
    where
        s = show n
        l = length s

module Euler.Combinatorics (linear_combinations) where

linear_combinations 0 _ _ = 1
linear_combinations n m ns | n < 0 = 0
          | m <= 0 && n >= 1 = 0
                    | otherwise = linear_combinations n (m-1) ns + linear_combinations (n - ns!!(m-1)) m ns



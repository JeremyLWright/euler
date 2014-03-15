--buildpan n x:xs = map (* n) [x:xs]
--buildpan n xs = foldl1 (\a b -> a * 10 + b) $ map (*n) $ reverse xs

--buildpan n xs = foldl1 (\a b -> a * 1000 + b) $ map (*n) xs

import Data.List
 
mult n i vs 
    | length (concat vs) >= 9 = concat vs
    | otherwise               = mult n (i+1) (vs ++ [show (n * i)])
 
prob038 :: Int
prob038 = maximum . map read . filter ((['1'..'9'] ==) . sort) 
               $ [mult n 1 [] | n <- [2..9999]]

main = print prob038

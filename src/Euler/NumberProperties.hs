module Euler.NumberProperties (isPandigital) where
import Data.List

isPandigital xs = sort ( foldl1 (++) convert) == "123456789" 
    where 
        convert = map show xs
        

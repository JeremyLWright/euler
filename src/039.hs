import Data.List

prims :: [[Integer]]
prims = group 
        $ sort [n*p | p <- ptrips, n <- [1..1000 `div` p]]

counts :: [Int]
counts = map length prims

j :: Int
Just j = elemIndex (maximum counts) counts

ptrips :: [Integer]
ptrips = [p | 
            n <- [1..floor(sqrt 1000)],
            m <- [n+1..floor(sqrt 1000)],
            even n || even m,
            gcd n m == 1,
            let a = m^2 - n^2,
            let b = 2*m*n,
            let c = m^2 + n^2,
            let p = a + b + c,
            p < 1000]

main :: IO()
main = print $ head $  prims !! j

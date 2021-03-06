import Data.Ratio


prob033 = denominator $ product [a%c | a <- t, b <- t, c <- t, isInteresting a b c, a /= b, b/=c]
    where 
        t = [1..9]
        isInteresting a b c = (10*a+b)%(10*b+c) == a%c

main :: IO()
main = print prob033

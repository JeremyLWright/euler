import Data.Char
prob034 = sum [ x | x <- [3..100000], x == facsum x ]
    where facsum = sum . map (product . enumFromTo 1 . digitToInt) . show

main = print prob034

prob019 =  length . filter (== sunday) . drop 12 . take 1212 $ since1900
since1900 = scanl nextMonth monday . concat $
              replicate 4 nonLeap ++ cycle (leap : replicate 3 nonLeap)
 
nonLeap = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
 
leap = 31 : 29 : drop 2 nonLeap
 
nextMonth x y = (x + y) `mod` 7
 
sunday = 0
monday = 1

main :: IO()
main = print prob019
--
--fstOrder = [('1', "one")
--    , ('2',"two")
--    , ('3', "three")
--    , ('4', "four")
--    , ('5', "five")
--    , ('6', "six")
--    , ('7', "seven")
--    , ('8', "eight")
--    , ('9', "nine")]
--sndOrder = [("10", "ten")
--    , ("11", "eleven")
--    , ("12", "twelve")
--    , ("13", "thirteen")
--    , ("14", "fourteen")
--    , ("15", "fifteen")
--    , ("16", "sixteen")
--    , ("17", "seventeen")
--    , ("18", "eighteen")
--    , ("19", "nineteen")]
----sndOrder = [("2", "twenty")
----    , ("3", "thirty")
----    , ("4", "fourty")
----    , ("5", "fifty")
----    , ("6", "sixty")
----    , ("7", "seventy")
----    , ("8", "eighty")
----    , ("9", "ninty")]
--thrdOrder = [("1", "hundred")]
--fourthOrder = [("1", "thousand")]
--
--
--
--englishify (x:xs)   | length xs == 3 = case lookup x fstOrder of
--                                        Just c -> c ++ " thousand " ++ englishify xs
--                                        Nothing -> []
--                    | length xs == 2 = case lookup xs sndOrder of
--                                        Just c -> c 
--                                        Nothing -> case lookup x fstOrder of
--                                                    Just c -> c ++ " hundred and " ++ englishify xs
--                                                    Nothing -> []
--                    | length xs == 1 = case lookup x fstOrder of
--                                        Just c -> c ++ englishify xs
--                                        Nothing -> []
--                    | length xs == 0 = []
--                    | otherwise = []
----                    | length xs == 2 = case lookup xs fstOrder of
--                                        Just c -> c
--                                        Nothing -> case lookup x fstOrder of 
--                                        case lookup x fstOrder of 
--                                                   Just c -> c ++ " hundred " ++ englishify xs
--                                                   Nothing -> []
--                    | length xs == 1 = case lookup x sndOrder of
--                                        Just c -> c ++ " " ++ englishify xs
--                                        Nothing -> []
--                    | length xs == 0 = case lookup x fstOrder of 
--                                        Just c -> c
--                                        Nothing -> []
--


--                | otherwise = ""

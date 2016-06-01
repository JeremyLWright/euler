
cornerSeq = 1 : fn 1 (+2)

fn s adder = adder s : snd s : third s : fourth s : fn (fourth s) (adder . (+2))
            where snd    = adder  . adder
                  third  = snd    . adder
                  fourth = third  . adder

main :: IO()
main = print $ (sum . takeWhile (<=1001^2)) cornerSeq


module Euler.Problems.P028 (prob028) where

corner_seq = 1 : (fn 1 (+2))

fn s adder = adder s : snd s : third s : fourth s : fn (fourth s) (adder . (+2))
            where snd    = (adder  . adder)
                  third  = (snd    . adder)
                  fourth = (third  . adder)

prob028 = (sum . takeWhile (<=1001^2)) corner_seq


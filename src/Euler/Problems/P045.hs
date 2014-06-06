module Euler.Problems.P045 (prob045 ) where
import Euler.Sequences

sames hn pn =   comparer h p
                where 
                    h = hex_number hn
                    p = pentagon_number pn
                    comparer h p    | h == p = h
                    comparer h p    | h >= p = sames hn (pn+1)
                    comparer h p    | otherwise = sames (hn+1) pn

prob045 = sames (143+1) (165+1)

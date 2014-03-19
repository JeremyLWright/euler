module Euler.Problems.P031 (prob031) where
import Euler.Combinatorics

coins = [1,2,5,10,20,50,100,200]

prob031 = linear_combinations 200 (length coins) coins

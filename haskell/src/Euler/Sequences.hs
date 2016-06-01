module Euler.Sequences (triangle_number, pentagon_number, hex_number) where


triangle_number n = n * (n + 1) `div` 2
pentagon_number n = n*(3*n - 1) `div` 2
hex_number      n = n*( 2 * n - 1)

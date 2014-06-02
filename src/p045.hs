

isPent n = (af == 0) && ai `mod` 6 == 5
  where (ai, af) = properFraction . sqrt $ 1 + 24 * (fromInteger n)

tri_numbers = [n * (n + 1) `div` 2 | n <- [285,286..]]

pent_numbers = [n*(3*n - 1) `div` 2 | n <- [165..]]
--hex_numbers = [n*(2*n-1) | n <- [143..]]

sames = [t | 	t <- tri_numbers, 
		isPent t]

main = print $ (take 2 sames)


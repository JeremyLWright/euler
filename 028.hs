
corner_seq = 1 : (fn 1 (+2))
    

fn s adder = adder s : (adder . adder) s : (adder . adder . adder) s : (adder. adder . adder . adder) s : fn ((adder . adder . adder . adder ) s) (adder . (+2))

main = print $ (sum . takeWhile (<=1001^2)) corner_seq


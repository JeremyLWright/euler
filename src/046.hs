import Test.HUnit
import Test.QuickCheck

divide2 :: Integral a => a -> a
divide2 x = x `div` 2

squareTerm x p | divide2 x `mod` p == 0 = True -- is can x be a square term of p
                | otherwise      = False
                where second_term = divide2 x 

main = print "working..."
 
-- Tests --
prop_div2:: Int -> Bool
prop_div2 n = divide2 n == n `div` 2

--tests = TestList $ map TestCase
--    [assertEqual (divide2 2) 1]
runTests = quickCheck prop_div2
    --runTestTT tests

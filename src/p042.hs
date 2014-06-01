import Data.Char
import Data.List
import Data.List.Split

tri_numbers = [n * (n + 1) `div` 2 | n <- [1..]]

-- fromIntegral converts the value up to arbitrary precision
letter_position :: Char -> Integer
letter_position l = fromIntegral $ ord l - ( ord 'A' - 1)

word_score :: [Char] -> Integer
word_score word = sum $ map letter_position word

alphabet_triangles :: [Integer]
alphabet_triangles = takeWhile (<26*100) tri_numbers -- score of all words up to 100 chars

problem_42 ls = 
	length [ a | a <- ls,
				elem (word_score a) alphabet_triangles]
main = do 
		contents <- readFile "src/Euler/Problems/Data/words.txt"
		let words = map remove_quotes $ splitOn "," contents
		print $ problem_42 words

remove_quotes word = delete '"' $ delete '"' word




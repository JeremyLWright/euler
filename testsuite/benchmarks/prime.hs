import Math.Sieve.ONeill
import Control.Exception
import System.CPUTime
import Text.Printf
import Control.Exception
import System.CPUTime

p = evaluate $ last $ takeWhile (<1000000) primes

time :: IO t -> IO t
time a = do
    start <- getCPUTime
    v <- a
    end   <- getCPUTime
    let diff = (fromIntegral (end - start)) / (10^12)
    printf "prime\t%0.3f\n" (diff :: Double)
    return v

main = do
    time $ p

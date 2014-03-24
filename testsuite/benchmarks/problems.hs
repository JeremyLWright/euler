import Criterion.Main
import Euler.Problems

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

w f = f

main = defaultMain [
       bgroup "Problems" [ 
        bench "p001" $ whnf w prob001 
        , bench "p002" $ whnf w prob002 
        , bench "p003" $ whnf w prob003 
        , bench "p004" $ whnf w prob004 
        , bench "p005" $ whnf w prob005 
        , bench "p006" $ whnf w prob006 
        , bench "p007" $ whnf w prob007
        , bench "p008" $ whnf w prob008 
        , bench "p009" $ whnf w prob009 
        , bench "p010" $ whnf w prob010 
        , bench "p011" $ whnf w prob011 
        , bench "p012" $ whnf w prob012 
        , bench "p013" $ whnf w prob013 
        , bench "p014" $ whnf w prob014 
        , bench "p015" $ whnf w prob015 
        , bench "p016" $ whnf w prob016 
        , bench "p017" $ whnf w prob017
        , bench "p018" $ whnf w prob018
        , bench "p019" $ whnf w prob019 
        , bench "p020" $ whnf w prob020 
        , bench "p021" $ whnf w prob021 
        , bench "p022" $ whnf w prob022 
        , bench "p023" $ whnf w prob023 
        , bench "p024" $ whnf w prob024 
        , bench "p025" $ whnf w prob025 
        , bench "p026" $ whnf w prob026 
        , bench "p027" $ whnf w prob027 
        , bench "p028" $ whnf w prob028 
        , bench "p029" $ whnf w prob029 
        , bench "p030" $ whnf w prob030 
        , bench "p031" $ whnf w prob031 
        , bench "p032" $ whnf w prob032 
        , bench "p033" $ whnf w prob033 
        , bench "p034" $ whnf w prob034 
        , bench "p035" $ whnf w prob035 
        , bench "p036" $ whnf w prob036 
        , bench "p037" $ whnf w prob037 
        , bench "p038" $ whnf w prob038 
        , bench "p039" $ whnf w prob039 

        ]
       ]

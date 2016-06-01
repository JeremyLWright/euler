import Criterion.Main
import Euler.Problems

w f = f

main = defaultMain [
       bgroup "Problems" [ 
          bench "p001" $ nf w prob001 
        , bench "p002" $ nf w prob002 
        , bench "p003" $ nf w prob003 
        , bench "p004" $ nf w prob004 
        , bench "p005" $ nf w prob005 
        , bench "p006" $ nf w prob006 
        , bench "p007" $ nf w prob007
        --, bench "p008" $ nf w prob008 
        , bench "p009" $ nf w prob009 
        , bench "p010" $ nf w prob010 
        --, bench "p011" $ nf w prob011 
        , bench "p012" $ nf w prob012 
        , bench "p013" $ nf w prob013 
        , bench "p014" $ nf w prob014 
        , bench "p015" $ nf w prob015 
        , bench "p016" $ nf w prob016 
        , bench "p017" $ nf w prob017
        , bench "p018" $ nf w prob018
        , bench "p019" $ nf w prob019 
        , bench "p020" $ nf w prob020 
        , bench "p021" $ nf w prob021 
        --, bench "p022" $ nf w prob022 
        , bench "p023" $ nf w prob023 
        , bench "p024" $ nf w prob024 
        , bench "p025" $ nf w prob025 
        , bench "p026" $ nf w prob026 
        , bench "p027" $ nf w prob027 
        , bench "p028" $ nf w prob028 
        , bench "p029" $ nf w prob029 
        --, bench "p030" $ nf w prob030 
        , bench "p031" $ nf w prob031 
        , bench "p032" $ nf w prob032 
        , bench "p033" $ nf w prob033 
        , bench "p034" $ nf w prob034 
        , bench "p035" $ nf w prob035 
        , bench "p036" $ nf w prob036 
        , bench "p037" $ nf w prob037 
        , bench "p038" $ nf w prob038 
        , bench "p039" $ nf w prob039 
        , bench "p040" $ nf w prob040 
        , bench "p041" $ nf w prob041 
        , bench "p046" $ nf w prob046 
        --, bench "p096" $ nf w prob096

        ]
       ]

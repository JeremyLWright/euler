cabal sandbox init
cabal install --enable-benchmarks --enable-tests
cabal test
cabal bench --benchmark-option=-urpt -oreport.html


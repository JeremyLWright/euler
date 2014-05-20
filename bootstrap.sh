cabal sandbox init
cabal install -j8 --enable-benchmarks --enable-tests --only-dependencies #Don't build the euler itself because we want to measure it separately
cabal configure --enable-benchmarks --enable-tests
date +'%s.%N' > 'dist/compile_times'
cabal build -j8
date +'%s.%N' >> 'dist/compile_times'
date +'%s.%N' > 'dist/run_times'
cabal test -j8 test-problems
date +'%s.%N' >> 'dist/run_times'
cabal bench bench-problems -j8 --benchmark-option=-udist/benchmark.dat
cabal bench bench-euler -j8 --benchmark-option=-udist/utilities.dat


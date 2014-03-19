make depend
make
make check
cabal-dev bench --benchmark-option=-urpt

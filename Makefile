SRCS=$(wildcard src/*.hs)
BENCH_SRCS=$(wildcard testsuite/benchmarks/*.hs)
BENCH_PROGS=$(patsubst %.hs,%,$(BENCH_SRCS))
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
HC=ghc
DEP_LIBS=dist/packages-7.6.3.conf
HC_OPTS=-O3 -isrc/ -package-db=$(DEP_LIBS)
GET_TIMESTAMP=$(shell date +%s.%N)
CABAL=$(HOME)/.cabal/bin/cabal-dev

.SUFFIXES: .o .hs .hi .lhs .hc .s

all: $(PROGS)

%: %.o $(LIBS) $(DEP_LIBS)
	@echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	@echo -n "$(GET_TIMESTAMP)\t" >> $(COMPILE_TIMES)
	$(HC) $(HC_OPTS) $*.hs
	@echo "$(GET_TIMESTAMP)" >> $(COMPILE_TIMES)

$(DEP_LIBS):
	$(CABAL) install -s dist/ digits

check: euler.png

bench: $(BENCH_PROGS)

dist/times.dat: $(PROGS)
	util/EulerValues.py --answers util/answers.js --file dist/times.dat $(PROGS)

euler.png: dist/times.dat $(BENCH_PROGS)
	testsuite/benchmarks/prime > dist/bench.dat
	octave util/process.m

clean: 
	rm -rf $(PROGS) $(BENCH_PROGS) dist/*
	find . -name *.o -exec rm -rf {} \;
	find . -name *.hi -exec rm -rf {} \;

.o.hi: 
	@:

.lhs.o:
	$(HC) -c $< $(HC_OPTS)

.hs.o:
	$(HC) -c $< $(HC_OPTS)

depend: $(DEP_LIBS)
	ghc -M $(HC_OPTS) $(SRCS)
# DO NOT DELETE: Beginning of Haskell dependencies
src/096.o : src/096.hs
src/046.o : src/046.hs
src/036.o : src/036.hs
src/034.o : src/034.hs
src/033.o : src/033.hs
src/030.o : src/030.hs
src/029.o : src/029.hs
src/028.o : src/028.hs
src/027.o : src/027.hs
src/025.o : src/025.hs
src/024.o : src/024.hs
src/022.o : src/022.hs
src/020.o : src/020.hs
src/019.o : src/019.hs
src/018.o : src/018.hs
src/017.o : src/017.hs
src/016.o : src/016.hs
src/015.o : src/015.hs
src/014.o : src/014.hs
src/013.o : src/013.hs
src/011.o : src/011.hs
src/009.o : src/009.hs
src/008.o : src/008.hs
src/006.o : src/006.hs
src/005.o : src/005.hs
src/004.o : src/004.hs
src/002.o : src/002.hs
src/001.o : src/001.hs
src/Euler/NumberProperties.o : src/Euler/NumberProperties.hs
src/032.o : src/032.hs
src/032.o : src/Euler/NumberProperties.hi
src/Euler/Combinatorics.o : src/Euler/Combinatorics.hs
src/031.o : src/031.hs
src/031.o : src/Euler/Combinatorics.hi
src/Euler/ONeillPrimes.o : src/Euler/ONeillPrimes.hs
src/Euler/NumberTheory.o : src/Euler/NumberTheory.hs
src/Euler/NumberTheory.o : src/Euler/ONeillPrimes.hi
src/003.o : src/003.hs
src/003.o : src/Euler/NumberTheory.hi
src/007.o : src/007.hs
src/007.o : src/Euler/NumberTheory.hi
src/007.o : src/Euler/ONeillPrimes.hi
src/010.o : src/010.hs
src/010.o : src/Euler/NumberTheory.hi
src/012.o : src/012.hs
src/012.o : src/Euler/NumberTheory.hi
src/021.o : src/021.hs
src/021.o : src/Euler/NumberTheory.hi
src/023.o : src/023.hs
src/023.o : src/Euler/NumberTheory.hi
src/026.o : src/026.hs
src/026.o : src/Euler/NumberTheory.hi
src/035.o : src/035.hs
src/035.o : src/Euler/NumberTheory.hi
src/035.o : src/Euler/Combinatorics.hi
src/037.o : src/037.hs
src/037.o : src/Euler/NumberTheory.hi
# DO NOT DELETE: End of Haskell dependencies

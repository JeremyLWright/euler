SRCS=$(wildcard src/*.hs)
BENCH_SRCS=$(wildcard testsuite/benchmarks/*.hs)
BENCH_PROGS=$(patsubst %.hs,%,$(BENCH_SRCS))
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
HC=ghc
HC_OPTS=-O3 -isrc/ -package-db=dist/dependencies/packages-7.6.3.conf --make
GET_TIMESTAMP=$(shell date +%s.%N)
CABAL=cabal-dev
DEP_LIBS=dist/dependencies

all: $(PROGS)

%: %.hs $(LIBS) $(DEP_LIBS)
	@echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	@echo -n "$(GET_TIMESTAMP)\t" >> $(COMPILE_TIMES)
	$(HC) $(HC_OPTS) $*.hs
	@echo "$(GET_TIMESTAMP)" >> $(COMPILE_TIMES)

$(DEP_LIBS):
	$(CABAL) install -s dist/dependencies digits

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



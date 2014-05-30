SRCS=$(wildcard src/*.hs)
BENCH_SRCS=$(wildcard testsuite/benchmarks/*.hs)
BENCH_PROGS=$(patsubst %.hs,%,$(BENCH_SRCS))
TEST_SRCS=$(wildcard testsuite/tests/Euler/*.hs)
TEST_PROGS=$(patsubst %.hs,%,$(TEST_SRCS))
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
HC=ghc
DEP_LIBS=dist/packages-7.6.3.conf
HC_OPTS=-Wall -prof -O -isrc/ -package-db=$(DEP_LIBS)
GET_TIMESTAMP=$(shell date +%s.%N)
CABAL=$(HOME)/.cabal/bin/cabal-dev

.SUFFIXES: .o .hs .hi .lhs .hc .s

.PHONY: all clean depend test

all: cabal.sandbox.config

cabal.sandbox.config:
	cabal sandbox init
	cabal install -j8 --enable-benchmarks --enable-tests --only-dependencies
	cabal configure --enable-benchmarks --enable-tests




%: %.o $(LIBS) $(DEP_LIBS)
	@echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	@echo -n "$(GET_TIMESTAMP)\t" >> $(COMPILE_TIMES)
	$(HC) $(HC_OPTS) $*.hs
	@echo "$(GET_TIMESTAMP)" >> $(COMPILE_TIMES)

$(DEP_LIBS):
	$(CABAL) install -p -s dist/ digits primes numbersieves exact-combinatorics

check: euler.pdf
	@:

test: $(TEST_PROGS)
	$(foreach x,$(TEST_PROGS),./$(x)${\n})

bench: $(BENCH_PROGS)
	@:

dist/times.dat: $(PROGS)
	util/EulerValues.py --answers util/answers.js --file dist/times.dat $(PROGS)

euler.pdf: dist/times.dat $(BENCH_PROGS)
	testsuite/benchmarks/prime > dist/bench.dat
	octave -q util/process.m

clean: 
	cabal sandbox delete

#Standard Suffix Rules
.o.hi: 
	@:

.lhs.o:
	$(HC) -c $< $(HC_OPTS)

.hs.o:
	$(HC) -c $< $(HC_OPTS)

depend: $(SRCS) $(DEP_LIBS)
	ghc -dep-makefile .depend -M $(HC_OPTS) $(SRCS)

lint:
	hlint src --report

-include .depend

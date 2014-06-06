#SRCS=$(wildcard src/*.hs)
#PROGS=$(patsubst src/%.hs,dist/build/%/%,$(SRCS))
#BENCH_SRCS=$(wildcard testsuite/benchmarks/*.hs)
#BENCH_PROGS=$(patsubst %.hs,%,$(BENCH_SRCS))
#TEST_SRCS=$(wildcard testsuite/tests/Euler/*.hs)
#TEST_PROGS=$(patsubst %.hs,%,$(TEST_SRCS))
#LIBS=$(wildcard src/Euler/*.hs)
COMPILE_TIMES=dist/compile.dat
#HC=ghc
#DEP_LIBS=dist/packages-7.6.3.conf
#HC_OPTS=-Wall -prof -O -isrc/ -package-db=$(DEP_LIBS)
GET_TIMESTAMP=$(shell date +%s.%N)
#CABAL=$(HOME)/.cabal/bin/cabal-dev

.PHONY: all clean


all: cabal.sandbox.config $(COMPILE_TIMES)

sandbox: cabal.sandbox.config

-include make.progs

cabal.sandbox.config:
	cabal sandbox init
	cabal install -j8 --enable-benchmarks --enable-tests --only-dependencies
	cabal configure --enable-benchmarks --enable-tests
	mkdir -p dist

$(COMPILE_TIMES): $(PROGS)

check: euler.pdf
	@:

dist/times.dat: $(PROGS)
	util/EulerValues.py --answers util/answers.js --file dist/times.dat $(PROGS)

euler.pdf: dist/times.dat $(BENCH_PROGS)
	testsuite/benchmarks/prime > dist/bench.dat
	octave -q util/process.m

clean: 
	rm -rf dist/*

distclean: clean
	cabal sandbox delete

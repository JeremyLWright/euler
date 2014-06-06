SRCS=$(sort $(wildcard src/*.hs))
PROGST=$(patsubst src/%.hs,%,$(SRCS))
PROGS=$(sort $(foreach root,$(PROGST),dist/build/$(root)/$(root)))
COMPILE_TIMES=dist/compile.dat
GET_TIMESTAMP=$(shell date +%s.%N)
.SUFFIXES: .hs
.PHONY: all clean

all: cabal.sandbox.config $(COMPILE_TIMES) dist/euler.pdf

sandbox: cabal.sandbox.config

-include make.progs


cabal.sandbox.config:
	cabal sandbox init
	cabal install -j8 --enable-benchmarks --enable-tests --only-dependencies
	cabal configure --enable-benchmarks --enable-tests
	mkdir -p dist

$(COMPILE_TIMES): $(PROGS)

depends: 
	python util/build.py

dist/euler.pdf: $(COMPILE_TIMES)
	octave -q util/process.m

clean: 
	rm -rf dist/*

distclean: clean
	cabal sandbox delete

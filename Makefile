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
HC_OPTS=-O3 -isrc/ -package-db=$(DEP_LIBS)
GET_TIMESTAMP=$(shell date +%s.%N)
CABAL=$(HOME)/.cabal/bin/cabal-dev

.SUFFIXES: .o .hs .hi .lhs .hc .s

.PHONY: all clean depend test

all: $(PROGS) .depend

%: %.o $(LIBS) $(DEP_LIBS)
	@echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	@echo -n "$(GET_TIMESTAMP)\t" >> $(COMPILE_TIMES)
	$(HC) $(HC_OPTS) $*.hs
	@echo "$(GET_TIMESTAMP)" >> $(COMPILE_TIMES)

$(DEP_LIBS):
	$(CABAL) install -s dist/ digits primes numbersieves

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
	rm -rf $(PROGS) $(BENCH_PROGS) dist/* .depend
	find . -name *.o -exec rm -rf {} \;
	find . -name *.hi -exec rm -rf {} \;

#Standard Suffix Rules
.o.hi: 
	@:

.lhs.o:
	$(HC) -c $< $(HC_OPTS)

.hs.o:
	$(HC) -c $< $(HC_OPTS)

depend: $(SRCS) $(DEP_LIBS)
	ghc -dep-makefile .depend -M $(HC_OPTS) $(SRCS)

-include .depend

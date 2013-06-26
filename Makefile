SRCS=$(wildcard src/*.hs)
BENCH_SRCS=$(wildcard testsuite/benchmarks/*.hs)
BENCH_PROGS=$(patsubst %.hs,%,$(BENCH_SRCS))
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
HC=ghc
HC_OPTS=-O3 -isrc/ --make

all: $(PROGS)

%: %.hs $(LIBS)
	echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	/usr/bin/time --format=%e $(HC) $(HC_OPTS) $*.hs 2>> $(COMPILE_TIMES)

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



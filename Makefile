SRCS=$(wildcard src/*.hs)
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
HC=ghc
HC_OPTS=-O2 -isrc/ --make

all: $(PROGS)

%: %.hs $(LIBS)
	echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	/usr/bin/time --format=%e $(HC) $(HC_OPTS) $*.hs 2>> $(COMPILE_TIMES)

check: euler.png

dist/times.dat: $(PROGS)
	util/EulerValues.py --answers util/answers.js --file dist/times.dat $(PROGS)

euler.png: dist/times.dat
	octave process.m

clean: 
	rm -rf $(PROGS) dist/*
	find src -name *.o -exec rm -rf {} \;
	find src -name *.hi -exec rm -rf {} \;



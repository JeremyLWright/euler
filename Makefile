SRCS=$(wildcard src/*.hs)
LIBS=$(wildcard src/Euler/*.hs)
PROGS=$(patsubst %.hs,%,$(SRCS))
COMPILE_TIMES=dist/compile.dat
all: $(PROGS)

%: %.hs $(LIBS)
	echo -n "$*.hs\t" >> $(COMPILE_TIMES)
	/usr/bin/time --format=%e ghc -outputdirdist -isrc/ -O2 --make $*.hs 2>> $(COMPILE_TIMES)

test: euler.png

times.dat: $(PROGS)
	python EulerValues.py

euler.png: times.dat
	octave process.m

clean: 
	rm -rf $(PROGS) dist/*

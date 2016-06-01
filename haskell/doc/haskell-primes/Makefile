SRCS=$(wildcard *Test.hs)
HC=ghc
HC_OPTS=-O3 -isrc/ --make
PROGS=$(patsubst %.hs,%,$(SRCS))

all: $(PROGS)

%: %.hs $(LIBS)
	$(HC) $(HC_OPTS) $*.hs

check: $(PROGS)
	rm compare.dat
	./time.sh AtkinSieveTest
	./time.sh BayerPrimesLimitTest
	./time.sh BayerPrimesTest
	./time.sh NaiveSieveLimitTest
	./time.sh NaurPrimesTest
	./time.sh ONeillPrimesLimitTest
	./time.sh ONeillPrimesTest
	./time.sh ReinkePrimesTest
	./time.sh RuncimanPrimesTest
	./time.sh SimplePrimesLimitTest
	./time.sh SimplePrimesTest
	./time.sh ZilibowitzPrimesTest

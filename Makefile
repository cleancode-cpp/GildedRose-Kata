CXX=g++
CPPFLAGS=-Wall
SRCDIR=.
BINDIR=bin
GTESTDIR=thirdparty/googletest/googletest
INCLUDES=-I$(GTESTDIR) -I$(GTESTDIR)/include
LINKFLAGS=

ifeq ($(OS),Windows_NT)
	PATHSEP2=\\
	BINEXT=.exe
	DELFILE=del
	MKDIRP=md	
else
	PATHSEP2=/
	BINEXT=
	DELFILE=rm -f
	MKDIRP=mkdir -p
	LINKFLAGS=-lpthread
endif
PATHSEP=$(strip $(PATHSEP2))

all: build

bin:
	$(MKDIRP) $(BINDIR)

build: build-unit build-text
build-unit: bin $(BINDIR)/GildedRoseUnitTests$(BINEXT)
build-text: bin $(BINDIR)/GildedRoseTextTests$(BINEXT)

$(BINDIR)/GildedRoseUnitTests$(BINEXT): $(SRCDIR)/GildedRose.cc $(SRCDIR)/GildedRose.h $(SRCDIR)/GildedRoseUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/GildedRoseUnitTests$(BINEXT) $(SRCDIR)/GildedRose.cc $(SRCDIR)/GildedRoseUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc $(LINKFLAGS)

$(BINDIR)/GildedRoseTextTests$(BINEXT): $(SRCDIR)/GildedRose.cc $(SRCDIR)/GildedRose.h $(SRCDIR)/GildedRoseTextTests.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/GildedRoseTextTests$(BINEXT) $(SRCDIR)/GildedRose.cc $(SRCDIR)/GildedRoseTextTests.cc $(LINKFLAGS)

test: $(BINDIR)/GildedRoseUnitTests$(BINEXT)
	$(BINDIR)/GildedRoseUnitTests$(BINEXT)

run: $(BINDIR)/GildedRoseTextTests$(BINEXT)
	$(BINDIR)/GildedRoseTextTests$(BINEXT)

clean:
	- $(DELFILE) $(BINDIR)$(PATHSEP)GildedRoseUnitTests$(BINEXT)
	- $(DELFILE) $(BINDIR)$(PATHSEP)GildedRoseTextTests$(BINEXT)

PROGRAM=yhs_test
CXXFLAGS=-std=c++14 -Wall -Wextra -Wpedantic -Wfatal-errors
WINCXX=i686-w64-mingw32-g++-posix -static-libgcc -static-libstdc++

$(PROGRAM): yhs_test.cpp yhs.o
	$(CXX) $(CXXFLAGS) yhs_test.cpp yhs.o -o $@

yhs.o: yhs.c yhs.h
	$(CXX) $(CXXFLAGS) yhs.c -o $@ -c

$(PROGRAM).exe: yhs_test.cpp yhs_win.o
	$(WINCXX) $(CXXFLAGS) yhs_test.cpp yhs_win.o -o $@ -lws2_32 -static -lpthread

yhs_win.o: yhs.c yhs.h
	$(WINCXX) $(CXXFLAGS) yhs.c -o $@ -c

clean:
	$(RM) $(PROGRAM) yhs.o $(PROGRAM).exe yhs_win.o

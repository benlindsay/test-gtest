# compiler variables and flags
CC := g++
CXX := g++
# CC := mpic++
LIB := -L lib
INC := -I include
CPPFLAGS += -isystem include

# Flags passed to the C++ compiler.
CXXFLAGS += -g -Wall -Wextra -pthread

lib/libgtest_main.a lib/libgmock_main.a: install-googletest.sh
	./install-googletest.sh

test.o: test.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c test.cpp $(INC) $(LIB)

test: test.o lib/libgtest_main.a
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -lpthread $^ $(INC) -o $@ $(LIB)

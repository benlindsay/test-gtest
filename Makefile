CXX := g++
LIB_DIR := lib64
LIB := -L $(LIB_DIR)
GTEST_FILE := $(LIB_DIR)/libgtest_main.a
INC := -I include
CPPFLAGS += -isystem include
CXXFLAGS += -g -Wall -Wextra -pthread

$(GTEST_FILE): install-googletest.sh
	./install-googletest.sh

test.o: test.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c test.cpp $(INC) $(LIB)

test: $(LIB_DIR)/libgtest_main.a test.o
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -lpthread $^ $(INC) -o $@ $(LIB)

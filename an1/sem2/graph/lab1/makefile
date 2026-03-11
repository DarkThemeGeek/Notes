#compilator
CXX = g++
#flaguri pt el
CXXFLAGS = -Wall -Wextra -std=c++17 -g -MMD -MP

#dir sursa
SRC_DIR = .
BUILD_DIR = build
TARGET = app

# Check if include/ exists, otherwise use src/
ifeq ($(wildcard include),include)
#folder headere
    INC_DIR = include
else
    INC_DIR = $(SRC_DIR)
endif

# Check if lib/ exists
ifeq ($(wildcard lib),lib)
#folder liburi
    LIB_DIR = lib
    LDFLAGS += -L$(LIB_DIR)
endif

CXXFLAGS += -I$(INC_DIR)

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

all: $(TARGET)

# Link
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS)

# Compile into build folder
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)

-include $(OBJS:.o=.d)

.PHONY: all clean
# Compiler
CC := gcc

# Directories
SRC_DIR := src
BUILD_DIR := build
DEST_DIR := dest

# Executable
TARGET := $(DEST_DIR)/program

# Libraries and includes
INCLUDES := -I./libs/SDL/include
LIBS := -L./dest/bin -lSDL3 -Wl,-rpath,'$$ORIGIN/bin'

# Sources and objects
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Compiler flags
CFLAGS := -Wall -Wextra -O0   # default: no optimization
ifeq ($(DEBUG),1)
    CFLAGS += -DDEBUG -g -O0
endif

ifeq ($(RELEASE),1)
    CFLAGS := -Wall -Wextra -O2
endif

# Default target
all: $(TARGET)

# Link
$(TARGET): $(OBJS) | $(DEST_DIR)
	$(CC) $(OBJS) $(LIBS) -o $@

# Compile each .c to .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Create build and dest directories if missing
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(DEST_DIR):
	mkdir -p $(DEST_DIR)

# Clean up object files
clean:
	rm -rf $(BUILD_DIR)/*.o

# Optional: clean everything including executable
fclean: clean
	rm -f $(TARGET)

.PHONY: all clean fclean

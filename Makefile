#=============================
#
# Author      : Lasercata
# Last update : 2024.02.21
# Version     : v1.0.2
#
#=============================

# ====== Target ======{{{1
TARGET = Target_name
# }}}1

# ====== Initialisation ======{{{1
# ------ Compiler ------{{{2
CC = gcc
CFLAGS = -W -Wall -Wconversion -Werror -std=gnu99
DEBUG_FLAGS = -O0 -g
PROD_FLAGS = -O2
# }}}2

# ------ Linker ------{{{2
LD_FLAGS =
# LD_FLAGS = -lm -W -Wall -pedantic -pthread
# }}}2

# ------ Directories ------{{{2
SRC_DIR = src
INCL_DIR = include
BUILD_DIR = build
BIN_DIR = bin

DIR_LST = $(SRC_DIR) $(INCL_DIR) $(BUILD_DIR) $(BIN_DIR)

# ------ Lists ------
SRC_LST = ${wildcard src/*.c}
OBJ_LST = ${SRC_LST:src/%.c=$(BUILD_DIR)/%.o}
# BIN_LST = ${SRC_LST:src/%.c=$(BIN_DIR)/%}
# }}}2
# }}}1

# ====== Rules ======{{{1
# ------ All ------{{{2
.PHONY: all
all: debug_or_prod_flags = $(PROD_FLAGS)
all: dirs $(BIN_DIR)/$(TARGET)

.PHONY: debug
debug: debug_or_prod_flags = $(DEBUG_FLAGS)
debug: dirs $(BIN_DIR)/$(TARGET)
# }}}2

# ------ Target ------{{{2
$(BIN_DIR)/$(TARGET): $(BUILD_DIR)/$(TARGET).o $(OBJ_LST)
	@echo ====== Linking $@ ======
	$(CC) \
		$^ \
		-o $@ \
		$(LD_FLAGS)

# ------ Objects ------
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(INCL_DIR)/%.h
	@echo ====== Compiling $@ ======
	$(CC) \
		$(CFLAGS) $(debug_or_prod_flags) \
		-c \
		$< \
		-o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@echo ====== Compiling $@ ======
	$(CC) \
		$(CFLAGS) $(debug_or_prod_flags) \
		-c \
		$< \
		-o $@
# }}}2

# ------ Remake ------{{{2
.PHONY: remake
remake: clean all

# ------ Remake debug ------
.PHONY: remake-debug
remake: clean debug
# }}}2

# ------ Run ------{{{2
.PHONY: run
run: $(BIN_DIR)/$(TARGET)
	./$(BIN_DIR)/$(TARGET)
# }}}2

# ------ Make directories ------{{{2
.PHONY: dirs
dirs: $(DIR_LST)
# dirs:
# 	@echo ====== Creating directories ======
# 	@for dir in $(DIR_LST); do \
# 		if [ ! -d $${dir} ]; then \
# 			echo Creating $${dir}; \
# 			mkdir -p $${dir}; \
# 		fi; \
# 	done

$(SRC_DIR):
	@echo ====== Creating $(SRC_DIR) directory ======
	@mkdir -p $(SRC_DIR)

$(INCL_DIR):
	@echo ====== Creating $(INCL_DIR) directory ======
	@mkdir -p $(INCL_DIR)

$(BIN_DIR):
	@echo ====== Creating $(BIN_DIR) directory ======
	@mkdir -p $(BIN_DIR)
	@echo "*" > $(BIN_DIR)/.gitignore

$(BUILD_DIR):
	@echo ====== Creating $(BUILD_DIR) directory ======
	@mkdir -p $(BUILD_DIR)
	@echo "*" > $(BUILD_DIR)/.gitignore
# }}}2

# ------ Clean ------{{{2
.PHONY: clean
clean: clean-obj clean-bin

# ------ Clean obj ------
.PHONY: clean-obj
clean-obj:
	@echo ====== Cleaning *.o ======
	rm -f $(OBJ_LST)

# ------ Clean bin ------
.PHONY: clean-bin
clean-bin:
	@echo ====== Cleaning bin/ ======
	rm -f $(BIN_DIR)/*
# }}}2
# }}}1

# vim:foldmethod=marker:foldlevel=0

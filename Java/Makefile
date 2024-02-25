#=============================
#
# Author      : Lasercata
# Last update : 2024.02.21
# Version     : v1.0.0
#
# This is a Java makefile.
#
#=============================

# ====== Main class ======{{{1
MAIN = Test

# If you want default arguments (to run), set those below. Otherwise, call `make run args="whatever arguments you want."`
args =
# }}}1

# ====== Initialisation ======{{{1
# ------ Compiler ------{{{2
CC = javac
RUNNER = java
# }}}2

# ------ Directories ------{{{2
SRC_DIR = src
CLASS_DIR = classes

DIR_LST = $(SRC_DIR) $(CLASS_DIR)

# ------ Lists ------
SRC_LST = ${wildcard src/*.java}
CLASS_LST = ${SRC_LST:src/%.java=$(CLASS_DIR)/%.class}
# }}}2
# }}}1

# ====== Rules ======{{{1
# ------ All ------{{{2
.PHONY: all
all: dirs $(CLASS_LST)
# }}}2

# ------ Classes ------{{{2
$(CLASS_DIR)/%.class: $(SRC_DIR)/%.java
	@echo ====== Compiling $@ ======
	$(CC) \
		-sourcepath $(SRC_DIR) \
		$< \
		-d $(CLASS_DIR)
# }}}2

# ------ Remake ------{{{2
.PHONY: remake
remake: clean all
# }}}2

# ------ Run ------{{{2
.PHONY: run
run: all
	cd $(CLASS_DIR) && $(RUNNER) $(MAIN) $(args)
# }}}2

# ------ Make directories ------{{{2
.PHONY: dirs
dirs: $(DIR_LST)

$(SRC_DIR):
	@echo ====== Creating $(SRC_DIR) directory ======
	@mkdir -p $(SRC_DIR)

$(CLASS_DIR):
	@echo ====== Creating $(CLASS_DIR) directory ======
	@mkdir -p $(CLASS_DIR)
	@echo "*" > $(CLASS_DIR)/.gitignore
# }}}2

# ------ Clean ------{{{2
.PHONY: clean
clean:
	@echo ====== Cleaning *.class ======
	rm -f $(CLASS_LST)
	# rm -f $(CLASS_DIR)/*
# }}}2
# }}}1

# vim:foldmethod=marker:foldlevel=0

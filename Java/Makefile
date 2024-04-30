#=============================
#
# Author      : Lasercata
# Last update : 2024.04.30
# Version     : v1.0.1
#
# This is a Java makefile.
#
#=============================

# ====== Main class ======{{{1
MAIN = Main

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
BIN_DIR = bin

DIR_LST = $(SRC_DIR) $(CLASS_DIR) $(BIN_DIR)

# ------ Lists ------
SRC_LST = ${wildcard src/*.java}
CLASS_LST = ${SRC_LST:src/%.java=$(CLASS_DIR)/%.class}
# }}}2
# }}}1

# ====== Rules ======{{{1
# ------ All ------{{{2
.PHONY: all
all: dirs $(CLASS_LST)

.PHONY: jar
jar: all $(BIN_DIR)/$(MAIN).jar
# }}}2

# ------ Make .jar ------{{{2
$(BIN_DIR)/$(MAIN).jar: $(CLASS_DIR)/$(MAIN).class $(BIN_DIR)
	@echo ====== Compiling $@ ======
	cd $(CLASS_DIR) && \
	jar cfe ../$@ $(MAIN) *.class
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

.PHONY: run-jar
run-jar: jar
	$(RUNNER) -jar $(BIN_DIR)/$(MAIN).jar $(args)
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

$(BIN_DIR):
	@echo ====== Creating $(BIN_DIR) directory ======
	@mkdir -p $(BIN_DIR)
	@echo "*" > $(BIN_DIR)/.gitignore
# }}}2

# ------ Clean ------{{{2
.PHONY: clean
clean:
	@echo ====== Cleaning *.class and *.jar ======
	rm -f $(CLASS_LST)
	rm -f $(BIN_DIR)/*.jar
# }}}2
# }}}1

# vim:foldmethod=marker:foldlevel=0

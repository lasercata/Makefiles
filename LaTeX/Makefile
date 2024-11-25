# ====== Target ======{{{1
TARGET = main
# }}}1

# ====== Initialisation ======{{{1
# ------ Compiler ------
CC = pdflatex

SRC_LST = ${wildcard sections/*.tex}

SRC_DIR = sections
# }}}1

# ====== Rules ======{{{1
# ------ All ------{{{2
.PHONY: all
all: $(TARGET).pdf
# }}}2

# ------ Target ------{{{2
$(TARGET).pdf: $(TARGET).tex $(SRC_LST)
	@echo ====== Compiling $@ ======
	$(CC) $<
	$(CC) $<
# }}}2

# ------ Init ------{{{2
.PHONY: init
init: $(SRC_DIR) .gitignore

$(SRC_DIR):
	@echo ====== Creating $(SRC_DIR) directory ======
	@mkdir -p $(SRC_DIR)

.gitignore:
	@echo ====== Creating $@ ======
	@echo *.synctex.gz > $@
	@echo "*.synctex(busy)" >> $@
	@echo *.fdb_latexmk >> $@
	@echo *.aux >> $@
	@echo *.fls >> $@
	@echo *.log >> $@
	@echo *.out >> $@
	@echo *.nav >> $@
	@echo *.snm >> $@
	@echo *.toc >> $@
	@echo *.vrb >> $@
	@echo *.lof >> $@
	@echo *.lot >> $@
	@echo *.loa >> $@
# }}}2

# ------ Remake ------{{{2
.PHONY: remake
remake: clean-all all
# }}}2

# ------ Clean ------{{{2
.PHONY: clean
clean:
	@echo ====== Cleaning ======
	@rm -f *.aux
	@rm -f *.log
	@rm -f *.nav
	@rm -f *.out
	@rm -f *.snm
	@rm -f *.toc
	@rm -f *.loa
	@rm -f *.synctex.gz
	@rm -f *.synctex\(busy\)
	@rm -f **/*.aux
	@rm -f **/*.log
	@rm -f **/*.nav
	@rm -f **/*.out
	@rm -f **/*.snm
	@rm -f **/*.toc
	@rm -f **/*.loa
	@rm -f **/*.synctex.gz
	@rm -f **/*.synctex\(busy\)

# ------ Clean pdf ------
.PHONY: clean-pdf
clean-pdf:
	@echo ====== Cleaning $(TARGET).pdf ======
	rm -f $(TARGET).pdf

# ------ Clean all ------
.PHONY: clean-all
clean-all: clean clean-pdf
# }}}2
# }}}1

# vim:foldmethod=marker:foldlevel=0

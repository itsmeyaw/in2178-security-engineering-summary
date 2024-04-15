.PHONY: all
FIGURES_DIR = ${BASEDIR}/src/figures
SHELL = /bin/bash

all:
	test -d ./build || mkdir build
	(test -d ${BASEDIR}/src/figures && cd src/figures && (for i in *.tex; do echo $i; pdflatex -halt-on-error -output-directory=. "$$i"; done)) || true
	cd src && pdflatex -halt-on-error -output-directory=../build/ summary.tex && pdflatex -output-directory=../build/ summary.tex 

.PHONY: clean
clean:
	rm -rf build
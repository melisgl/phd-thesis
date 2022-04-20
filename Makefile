all: paper.pdf

include paper.makefile

TEX_FILES = paper.tex mogrifier/mogrifier.tex micmco/micmco.tex\
	two-tailed/two-tailed.tex circling-back/circling-back.tex

paper.pdf:  $(TEX_FILES) allimages
	latexmk -e '$$max_repeat=5' -pdf -shell-escape \
		-interaction=nonstopmode \
		-halt-on-error -file-line-error paper.tex

clean:
	latexmk -c paper.tex

distclean: clean
	latexmk -C paper.tex
	rm -f *.bbl
	rm tikz/*

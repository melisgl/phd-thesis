ALL_FIGURE_NAMES=$(shell cat paper.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

figures/paper-figure0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/paper-figure0" "\def\tikzexternalrealjob{paper}\input{paper}"

figures/paper-figure0.pdf: figures/paper-figure0.md5
figures/paper-figure1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/paper-figure1" "\def\tikzexternalrealjob{paper}\input{paper}"

figures/paper-figure1.pdf: figures/paper-figure1.md5

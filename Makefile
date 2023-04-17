export SHELL=/bin/bash

.SUFFIXES: .pdf .tex
.PHONY: FORCE all clean realclean

A=proposal
B=appB
C=appC
PUBS=all_pubs

all:	$(A).pdf #$(B).pdf $(C).pdf #$(PUBS).pdf

#(PUBS).pdf: $(C).pdf bj-pubs.pdf
#	pdfunite $(C).pdf bj-pubs.pdf $(PUBS).pdf

%.pdf: %.tex FORCE
	latexmk -pdf $<

continuous:
	sh -c "while true; do inotifywait -e modify *.tex *.bib; make; done"

clean:
	latexmk -c
	$(RM) *.aux *~

realclean: clean
	$(RM) $(A).pdf $(B).pdf $(C).pdf $(PUBS).pdf

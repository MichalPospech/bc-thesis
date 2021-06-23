NAME=thesis
ABSTRACT=abstract
REFS=refs.bib
TEXFLAGS=-halt-on-error
TEX=pdflatex #possibly switch to lualatex/xelatex
BIB=bibtex #possibly switch to biber (remove backend=bibtex from biblatex opts)

RMF=rm -f

PDFS=$(NAME).pdf $(ABSTRACT)-en.pdf $(ABSTRACT)-cz.pdf

all: $(PDFS)

$(NAME).pdf: $(wildcard *.tex) $(REFS) $(NAME).xmpdata
	$(TEX) $(TEXFLAGS) $(NAME)
	$(BIB) $(NAME)
	$(TEX) $(TEXFLAGS) $(NAME)
	$(TEX) $(TEXFLAGS) $(NAME)

$(ABSTRACT)-%.pdf: $(ABSTRACT)-%.tex $(ABSTRACT)-%.xmpdata metadata.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(RMF) *.log *.dvi *.aux *.toc *.lof *.lot *.out *.bbl *.blg *.xmpi

clean-all: clean
	$(RMF) $(PDFS)

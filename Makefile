# Commands to compile
LATEX  = platex
BIBTEX = pbibtex
DVIPDF = dvipdfmx
DVIPS  = dvips

# Used bibtex or not (yes|no)
BIBTEX_ENABLED = no

# Root document name (i.e. the name of root.txt is 'root')
ROOT = root

# Your class name if you describe your own .cls file.
# Specify empty if you use a standard class.
CLASS_FILE = # your_cls.cls

# Specify your .bib if you use bibtex, otherwise specify empty
BIB_FILE = # your_bib.bib

# Directory which contains .tex files included in the document if the document
# consists of more than one .tex file.
TEX_DIR = # body

# Directory which contains .svg files included in the document if the document
# contains image(s).
SVG_DIR = # img




TEX_FILES = \
    $(wildcard $(TEX_DIR)/*.tex) \
    $(ROOT).tex
SVG_FILES = \
    $(wildcard $(SVG_DIR)/*.svg)
ROOT_TEX = $(ROOT).tex
ROOT_DVI = $(ROOT).dvi
ROOT_PDF = $(ROOT).pdf
ROOT_PS  = $(ROOT).ps
ROOT_AUX = $(ROOT).aux
ifeq ($(BIBTEX_ENABLED),yes)
ROOT_BBL = $(ROOT).bbl
endif

EPS_FILES = $(SVG_FILES:%.svg=%.eps)
AUX_FILES = $(TEX_FILES:%.tex=%.aux)
GENERATED_FILES = \
	$(ROOT).log \
	$(ROOT).toc \
	$(ROOT).lof \
	$(ROOT).lot \
	$(ROOT).bbl \
	$(ROOT).blg \
	$(ROOT).idx \
	$(ROOT).out \
	texput.log

.DEFAULT_GOAL = pdf

.PHONY : pdf
pdf : $(ROOT_PDF)
$(ROOT_PDF) : $(ROOT_DVI)
	$(DVIPDF) $(ROOT_DVI)

.PHONY : ps
ps : $(ROOT_PS)
$(ROOT_PS) : $(ROOT_DVI)
	$(DVIPS) $(ROOT_DVI)

.PHONY : dvi
dvi : $(ROOT_DVI) $(CLASS_FILE)
$(ROOT_DVI) : $(ROOT_BBL) $(TEX_FILES) $(AUX_FILES)
	$(LATEX) -halt-on-error $(ROOT_TEX)
	$(LATEX) -halt-on-error $(ROOT_TEX)

.PHONY : aux
aux : $(AUX_FILES)
$(AUX_FILES) : $(TEX_FILES) $(EPS_FILES)
	$(LATEX) -halt-on-error $(ROOT_TEX)

.PHONY : bbl
bbl : $(ROOT_BBL)
$(ROOT_BBL) : $(AUX_FILES) $(BIB_FILE)
	$(BIBTEX) $(ROOT_AUX)

.PHONY : eps
eps : $(EPS_FILES)
%.eps : %.svg
	inkscape --export-area-drawing --without-gui --file="$<" --export-eps="$@"

.PHONY : clean
clean:
	$(RM) $(ROOT_PDF)
	$(RM) $(ROOT_DVI)
	$(RM) $(ROOT_PS)
	$(RM) $(ROOT_BBL)
	$(RM) $(EPS_FILES)
	$(RM) $(AUX_FILES)
	$(RM) $(GENERATED_FILES)

.PHONY : help
help:
	@echo "make dvi"
	@echo "        Make DVI file from tex documents."
	@echo "make pdf"
	@echo "        Make PDF file from DVI file."
	@echo "make ps"
	@echo "        Make PS file from DVI file."
	@echo "make clean"
	@echo "        Remove all generated files."


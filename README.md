TeX-Makefile
============
Makefile to compile TeX document.

Who to use ?
------------
In the first, edit `Makefile` and place in in the root directory directory
containing your document.  The options in `Makefile` you need to specify are
explained in Options section.

To create a PDF file, run `make` with `pdf` target as following :

    make pdf

You can remove the generated file with `clean` target :

    make clean

If you want to see more targets, use `help` target :

    make help


Options
-------

### commands to compile ###
Following options are command to compile a document.

    LATEX  = platex
    BIBTEX = pbibtex
    DVIPDF = dvipdfmx
    DVIPS  = dvips

### BIBTEX\_ENABLED ###
If you use bibtex, specify as `BIBTEX\_ENABLED = yes`, otherwise set other
value or empty.  If you mistake this option, `make` will fail in compiling.

### ROOT ###
ROOT is a name of root .tex file to compile and compiled documents name.

### CLASS\_FILE ####
CLASS\_FILE is your own .cls file.  Specify empty If you use standard class.

### BIB\_FILE###
BIB\_FILE is a .bib file which contains bibliographies.  If you don't use
bibtex, specify empty.

### TEX\_DIR ###
TEX\_FILES is a directory name contains .tex files included in the document if
the document consists of more than one .tex file.  For example, if the document
consists of `root.tex`, `a.tex`, and `b.tex` and directory structure is the
following, specify as `TEX\_DIR = body`

    root.tex
    body
      |- a.tex
      `- b.tex

### SVG\_DIR ###
SVG\_DIR is a directory which contains .svg files included in the document.  If
the images is included as the following, specify as `SVG\_DIR = img`.

    root.tex
    img
      |- a.svg
      `- b.svg


Copyright & License
-------------------
Copyright (c) 2014 Shin'ya Ueoka.
This is licensed under MIT license.

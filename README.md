TeX-Makefile
============
Makefile to compile TeX document.

Who to use ?
------------
In the first, edit `Makefile.template` and save as `Makefile`.  The options in
`Makefile` you need to specify are explained in Options section.

To create a PDF file, run `make` with `pdf` target as following :

    make pdf

You can remove the generated file with `clean` target :

    make clean

If you want to see more targets, use `help` target :

    make help


Options
-------

### TARGET ###
TARGET is a name of root tex file to compile and compiled documents name.

### CLASS\_FILE ####
CLASS\_FILE is a class file name you use.  If you don't use your class file,
specify empty.

### TEX\_FILES ###
TEX\_FILES is a set of tex files you use in document by `\input` or `\include`.

### SVG\_FILES ###
SVG\_FILES is a set of image files you use in a document.  The specified files
are converted to EPS by inkscape.

### BIBTEX\_ENABLED ###
If you use bibtex, set BIBTEX\_ENABLED `yes`, otherwise set other value or
empty.  If you mistake this option, `make` will fail in compile.

### commands to compile ###
Following options are command to compile a document.

    LATEX = latex
    BIBTEX = bibtex
    DVIPDF = dvipdfm
    DVIPS = dvips

If you write a document in Japanese, you have to specify compiler for
Japanese such as `platex`, `pbibtex` and `dvipdfmx`.


Copyright & Lisence
-------------------
Copyright (c) 2013 Shin'ya Ueoka.
This is licensed under MIT lisence.

LaTeX-report-template-CERN
==========================

Template in LaTeX for openlab Summer Student report and presentation at CERN

## Report --- `CoSSRT.tex`
Due to font selections, please compile with `lualatex` i.e.

	lualatex CoSSRT.tex

or simply:

	make reportP

If you are using BibTeX please follow:

	lualatex CoSSRT.tex
	bibtex CoSSRT
	lualatex CoSSRT.tex
	lualatex CoSSRT.tex

or simply:

	make report

## Presentation --- `CoSSPT.tex`
Please compile with `pdflatex` i.e.

	pdflatex CoSSRT.tex

or simply:

	make presentationP

If you are using BibTeX please follow:

	pdflatex CoSSRT.tex
	biber CoSSRT
	pdflatex CoSSRT.tex
	pdflatex CoSSRT.tex

or simply:

	make presentation

The default presentation is in 16:9 format as the CERN original template, if you prefer old, good 4:3 proportions please swap commented document type definition lines:

	% \documentclass[aspectratio=169]{beamer}
	\documentclass{beamer}

### Presentation in PowerPoint format
If for some reason (CERN specific) you are forced to deliver presentation in `pptx` format please do:

	make convert

to get PowerPoint format; it is not beautiful, but sufficient.

The conversion procedure requires `Python` and module `python-pptx`, available [here](https://github.com/scanny/python-pptx "python-pptx module"). The easiest way to install it, is to use `pip`:

	pip install python-pptx

## Platform dependencies
As the CERN template is using multiple fonts it is required to have them installed.

	https://aur.archlinux.org/packages/ttf-vista-fonts/ and after that run

then do:

	mkluatexfontdb

to update LaTeX font database.

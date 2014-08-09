LaTeX-report-template-CERN
==========================

Template in LaTeX for openlab Summer Student report and presentation at CERN

# Report --- `CoSSRT.tex`
Due to font selections, please compile with `lualatex` i.e.

	lualatex CoSSRT.tex

If you are using BibTeX please follow:

	lualatex CoSSRT.tex
	bibtex CoSSRT
	lualatex CoSSRT.tex
	lualatex CoSSRT.tex

# Presentation --- `CoSSPT.tex`
Please compile with `pdflatex` i.e.

	pdflatex CoSSRT.tex

If you are using BibTeX please follow:

	pdflatex CoSSRT.tex
	biber CoSSRT
	pdflatex CoSSRT.tex
	pdflatex CoSSRT.tex

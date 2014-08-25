all: report
report: report
reportP: report_plain
presentation: presentation
presentationP: presentation_plain
clean: clean_all
convert: convert_presentation

report:
	lualatex CoSSRT.tex
	bibtex CoSSRT
	lualatex CoSSRT.tex
	lualatex CoSSRT.tex

report_plain:
	lualatex CoSSRT.tex

presentation:
	pdflatex CoSSPT.tex
	biber CoSSPT
	pdflatex CoSSPT.tex
	pdflatex CoSSPT.tex

presentation_plain:
	pdflatex CoSSPT.tex

clean_all:
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	rm -f *.bbl
	rm -f *.blg
	rm -f *.bcf
	rm -f *.nav
	rm -f *.run.xml
	rm -f *.snm
	rm -fr presentation_image

convert_presentation:
	mkdir -p presentation_image
	convert -verbose -density 600 -fill white -opaque none -quality 100 -resize 1600x -fill white -opaque none "CoSSPT.pdf" "presentation_image/%02d.png"
	{ echo "import pptx" ;\
	  echo "import glob" ;\
	  echo "p = pptx.Presentation()" ;\
	  echo "ims = sorted(glob.glob('presentation_image/*'))"; \
	  echo "blank_slide_layout= p.slide_layouts[6]" ;\
  	  echo "for im in ims:" ;\
	  echo "	slide = p.slides.add_slide(blank_slide_layout)" ;\
	  echo "	slide.shapes.add_picture(im, 0, 0, p.slide_width, p.slide_height)" ;\
	  echo "p.save('CoSSPT.pptx')" ;\
	} | python

convert_presentation_sh:
	mkdir -p presentation_image
	convert -verbose -density 600 -fill white -opaque none -quality 100 -resize 1600x -fill white -opaque none "CoSSPT.pdf" "presentation_image/%02d.png"
	# pip install python-pptx
	python - <<END
	## Python code
	import pptx
	import glob
	p = pptx.Presentation()
	ims = sorted(glob.glob("presentation_image/*"))
	blank_slide_layout= p.slide_layouts[6]
	for im in ims:
		slide = p.slides.add_slide(blank_slide_layout)
		slide.shapes.add_picture(im, 0, 0, p.slide_width, p.slide_height)
	p.save("CoSSPT.pptx")

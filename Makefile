report: report
reportP: report_plain
presentation: presentation
presentationP: presentation_plain
clean: clean_all
convert: convert_presentation169

report:
	lualatex CoSSRT.tex
	bibtex CoSSRT
	lualatex CoSSRT.tex
	lualatex CoSSRT.tex

report_plain:
	lualatex CoSSRT.tex

presentation:
	pdflatex CoSSRT.tex
	biber CoSSRT
	pdflatex CoSSRT.tex
	pdflatex CoSSRT.tex

presentation_plain:
	pdflatex CoSSRT.tex

clean_all:
	rm 

convert_presentation169:
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

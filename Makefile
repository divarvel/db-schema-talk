all: slides.html

slides.html: slides.md template.html
	pandoc -t dzslides \
		   --self-contained \
		   --template template.html \
	       -s slides.md \
		   -o slides.html

slides.pdf: slides.tex
	pdflatex slides.tex

slides.tex: slides.md
	pandoc -t beamer \
		   -s slides.md \
		   -o slides.tex

clean:
	-rm slides.tex
	-rm slides.log
	-rm slides.nav
	-rm slides.snm
	-rm slides.toc
	-rm slides.vrb
	-rm slides.aux
	-rm slides.out

mrproper: clean
	-rm slides.html
	-rm slides.pdf

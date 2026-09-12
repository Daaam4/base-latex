MAIN=000report
all:
	latexmk -pdf -interaction=nonstopmode $(MAIN).tex
clean:
	latexmk -c; rm -f pages/*.aux
open: all
	open $(MAIN).pdf
watch:
	latexmk -pdf -pvc -interaction=nonstopmode $(MAIN).tex
.PHONY: all clean open watch

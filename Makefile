chapters := $(notdir $(wildcard chapters/*.tex))
#chapters_obj := $(add-prefix build/,$chapters_src)

all: main.pdf

main.pdf: main.tex $(chapters:%.tex=build/%.tex)
	xelatex main.tex

build/%.tex: chapters/%.tex
	mkdir -p build
	cat $< | sed -e 's/&/\\&/g' > $@

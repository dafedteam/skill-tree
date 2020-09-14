png:
	cat skills.dot | docker run --rm -i nshine/dot > build/skills.png

svg:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tsvg > build/skills.svg

html:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tsvg > build/skills.html

# https://graphviz.org/doc/info/output.html#d:ps
pdf:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tps2 > build/skills.ps2
	ps2pdf build/skills.ps2 build/skills.pdf
	rm build/skills.ps2

all: png svg pdf html

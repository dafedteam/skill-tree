png:
	cat skills.dot | docker run --rm -i nshine/dot > build/skills.png

svg:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tsvg > build/skills.svg

pdf:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tpdf > build/skills.pdf

html:
	cat skills.dot | docker run --rm -i nshine/dot dot -Tsvg > build/skills.html

all: png svg pdf html

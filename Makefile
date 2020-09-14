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

bump:
	$(eval VERSION=$(shell git describe --tags --abbrev=0 | awk -F. '{$$NF+=1; OFS="."; print $0}'))
	cp build/skills.png .github/img/skills.png
	git add .github/img/skills.png
	git commit -m 'update sample image to readme'
	git push -u origin master
	git tag $(VERSION) -m "new release"
	git push origin $(VERSION)

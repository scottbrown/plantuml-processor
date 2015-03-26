package = unbounce/plantuml-processor
tag = latest

default: build

clean:
	rm -f tests/outbox/*

build:
	docker build -t $(package):$(tag) .

dist: build
	docker push $(package):$(tag)

test: build
	docker run -v `pwd`/tests/inbox:/inbox -v `pwd`/tests/outbox:/outbox $(package):$(tag)
	test -e tests/outbox/sample.png


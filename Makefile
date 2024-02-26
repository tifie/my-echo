NAME := sandbox
REPOSITORY := tifie/$(NAME)
TAG := 20240226
GOOS := linux
GOARCH := amd64

.PHONY: build test image-build image-push clean
build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o _output/$(NAME) .

test:
	go test -v

image-build:
	docker build -t ghcr.io/$(REPOSITORY):$(TAG) .

image-push:
	docker push ghcr.io/$(REPOSITORY):$(TAG)

clean:
	rm -rf _output

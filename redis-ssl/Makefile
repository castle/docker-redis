APPLICATION=redis
REPOSITORY=castle
VERSION=${VERSION}
TAG=${TAG}
RELEASE=ssl

.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	cp ../shared/generate-key.sh .
	cp ../shared/ca.crt .
	cp ../shared/ca.key .

clean:
	rm ca.crt ca.key generate-key.sh

build: prepare docker-build clean

build-no-cache: prepare docker-build-no-cache clean

docker-build:
	docker build -t $(APPLICATION) --build-arg VERSION=$(VERSION) .

docker-build-no-cache:
	docker build --no-cache -t $(APPLICATION) --build-arg VERSION=$(VERSION) .

release: build-no-cache publish

publish: tag
	docker push $(REPOSITORY)/$(APPLICATION):$(TAG)-$(RELEASE)

tag:
	docker tag $(APPLICATION) $(REPOSITORY)/$(APPLICATION):$(TAG)-$(RELEASE)

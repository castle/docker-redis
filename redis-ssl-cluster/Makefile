APPLICATION=redis
REPOSITORY=castle
VERSION=${VERSION}
TAG=${TAG}
RELEASE=ssl-cluster

.PHONY: help

help: ## show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## build container
	docker build -t $(APPLICATION) --build-arg VERSION=$(VERSION) .

build-nc: ## build container without caching
	docker build --no-cache -t $(APPLICATION) --build-arg VERSION=$(VERSION) .

release: build-nc publish ## release container to docker hub

publish: tag ## publish container tag
	docker push $(REPOSITORY)/$(APPLICATION):$(TAG)-$(RELEASE)

tag: ## generate container tag
	docker tag $(APPLICATION) $(REPOSITORY)/$(APPLICATION):$(TAG)-$(RELEASE)

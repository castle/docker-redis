APPLICATION=redis-ssl
REPOSITORY=castle
VERSION=4.0.10

.PHONY: help

help: ## show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## build container
	docker build -t $(APPLICATION) .

build-nc: ## build container without caching
	docker build --no-cache -t $(APPLICATION) .

release: build-nc publish ## release container to docker hub

publish: tag ## publish `latest` container tag
	docker push $(REPOSITORY)/$(APPLICATION):latest
	docker push $(REPOSITORY)/$(APPLICATION):$(VERSION)

tag: ## generate container `latest` tag
	docker tag $(APPLICATION) $(REPOSITORY)/$(APPLICATION):latest
	docker tag $(APPLICATION) $(REPOSITORY)/$(APPLICATION):$(VERSION)

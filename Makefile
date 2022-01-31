.PHONY: build test

NAME=lucor/composer
VERSION=2.2.5

build:
	docker build \
		--tag $(NAME):latest \
		--tag $(NAME):$(VERSION) \
		.

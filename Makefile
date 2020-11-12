.PHONY: build test

NAME=lucor/composer
VERSION=2.0.6

build:
	docker build \
		--tag $(NAME):latest \
		--tag $(NAME):$(VERSION) \
		.

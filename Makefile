.PHONY: build test

NAME=lucor/composer
VERSION=2.0.9

build:
	docker build \
		--tag $(NAME):latest \
		--tag $(NAME):$(VERSION) \
		.

.PHONY: build test

NAME=lucor/composer
VERSION=1.3.1

build:
	docker build \
		--tag $(NAME):latest \
		--tag $(NAME):$(VERSION) \
		.

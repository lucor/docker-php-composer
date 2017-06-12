.PHONY: build test

NAME=lucor/composer
VERSION=1.4.2

build:
	docker build \
		--tag $(NAME):latest \
		--tag $(NAME):$(VERSION) \
		.

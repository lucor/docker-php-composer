# Lightweight Docker Image for Composer

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:
  - composer `v1.0.0-alpha11`
  - php `v7.0.3`

## Examples

  docker run --rm -ti -v $(pwd):/app lucor/composer help

  docker run --rm -ti -v $(pwd):/app -v $HOME/.composer:/root/.composer lucor/composer --ansi help

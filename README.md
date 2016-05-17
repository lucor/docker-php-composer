# Lightweight Docker Image for Composer

[![](https://badge.imagelayers.io/lucor/composer:latest.svg)](https://imagelayers.io/?images=lucor/composer:latest 'Get your own badge on imagelayers.io')

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:

  - composer `v1.1.1`
  - php `v7.0.x`

For the full list of available PHP extensions see the [lucor/php7-cli](https://hub.docker.com/r/lucor/php7-cli/) base image

## Examples

```
  docker run --rm -ti \
    -v $(pwd):/app \
    lucor/composer help
```
```
  docker run --rm -ti
    -v $(pwd):/app \
    -v $HOME/.composer:/home/.composer \
    -u $(id -u):$(id -g) \
    lucor/composer --ansi help
```
```
  docker run --rm -ti \
    -v $(pwd):/app \
    -v $HOME/.composer:/home/.composer \
    -v $HOME/.ssh:/home/.ssh:ro \
    -u $(id -u):$(id -g) \
    lucor/composer --ignore-platform-reqs install
```

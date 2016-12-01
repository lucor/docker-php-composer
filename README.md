# Lightweight Docker Image for Composer

[![](https://images.microbadger.com/badges/image/lucor/composer.svg)](http://microbadger.com/images/lucor/composer "Get your own image badge on microbadger.com")

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:

  - composer `v1.2.3`
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

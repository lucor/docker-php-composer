# Lightweight Docker Image for Composer

## DEPRECATED
This image has been deprecated in favour of the [official composer Docker Container](https://hub.docker.com/_/composer/) that now is built on Alpine and PHP 7.

[![](https://images.microbadger.com/badges/image/lucor/composer.svg)](http://microbadger.com/images/lucor/composer "Get your own image badge on microbadger.com")

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:

  - composer `v2.0.9`
  - php `v7.4.x`

## Usage

### Display composer help

```
  docker run --rm -ti \
    -v $(pwd):/app \
    lucor/composer
```

### Install the project dependencies

The following command will:

 - mount the current directory containing the source code
 - mount the `$HOME/.composer` directory to share cache and token
 - preserve current uid e group

```
  docker run --rm -ti
    -v $(pwd):/app \
    -v $HOME/.composer:/home/.composer \
    -u $(id -u):$(id -g) \
    lucor/composer --ansi install
```

### Install the project dependencies

The following command will:

 - mount the current directory containing the source code
 - mount the `$HOME/.composer` directory to share cache and token
 - mount the `$HOME/.ssh` directory to share ssh keys
 - preserve current uid e group

```
  docker run --rm -ti \
    -v $(pwd):/app \
    -v $HOME/.composer:/home/.composer \
    -v $HOME/.ssh:/home/.ssh:ro \
    -u $(id -u):$(id -g) \
    lucor/composer --ignore-platform-reqs install
```

### Use the binary with third-party images

Depending on your project, you could need a different version of PHP.
The image expose the `composer` binary via a `/composer/bin` volume.

To create a named container that share the volume:

```
  docker create -v /composer/bin --name composer lucor/composer /bin/true
```

Now you can use the `--volume-from` flag to mount the `/composer/bin` volume from
the `composer` container in another container:

```
  docker run --rm -ti --volumes-from composer php:7.1-alpine /composer/bin/composer -v
```

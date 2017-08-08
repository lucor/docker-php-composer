# Lightweight Docker Image for Composer

[![](https://images.microbadger.com/badges/image/lucor/composer.svg)](http://microbadger.com/images/lucor/composer "Get your own image badge on microbadger.com")

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:

  - composer `v1.5.0`
  - php `v7.1.x`

For the full list of available PHP extensions see the [lucor/php7-cli](https://hub.docker.com/r/lucor/php7-cli/) base image

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

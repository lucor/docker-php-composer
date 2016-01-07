# Lightweight Docker Image for Composer

A lightweight Docker image for [Composer](https://getcomposer.org/)

It provides:
  - composer `v1.0.0-alpha11`
  - php `v5.6.16`

## Example

  docker run -ti --rm -v $(pwd):/app lucor/composer help

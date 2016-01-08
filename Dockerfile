FROM alpine:edge

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

ENV COMPOSER_VERSION 1.0.0-alpha11

RUN apk --update add \
  curl \
  git \
  php-cli \
  php-openssl \
  php-dom \
  php-mcrypt \
  php-zip \
  php-bz2 \
  php-json \
  php-xml \
  php-phar

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

RUN rm -rf /var/cache/apk/* \
  && rm -rf /tmp/npm*

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/composer"]

FROM alpine:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

ENV COMPOSER_VERSION 1.0.0-alpha11

RUN apk --update add curl \
	php-cli \
	php-openssl \
	php-json \
	php-phar

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

RUN rm -rf /var/cache/apk/* \
  && rm -rf /tmp/npm*

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/composer"]

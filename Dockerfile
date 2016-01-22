FROM lucor/php7-cli:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

ENV COMPOSER_VERSION 1.0.0-alpha11

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/composer"]

FROM php:7.4-cli-alpine

WORKDIR /app

VOLUME /home

COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["composer"]
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8

ENV COMPOSER_VERSION "2.2.5"

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) === getenv('COMPOSER_SETUP_SHA')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); echo PHP_EOL; exit(1); } echo PHP_EOL;" \
    && mkdir -p /composer/bin \
    && php /tmp/composer-setup.php --install-dir=/composer/bin --filename=composer --version=${COMPOSER_VERSION} \
    && rm /tmp/composer-setup.php \
    && ln -sf /composer/bin/composer /usr/local/bin/composer

# Set up a /composer/bin volume so that the composer binary can be mounted
# and used in third-party php images (i.e with differents php versions)
VOLUME /composer/bin

RUN apk add --no-cache \
    bash \
    libzip \
    libzip-dev \
    git

RUN docker-php-ext-install zip

FROM php:7.4-cli-alpine

WORKDIR /app

VOLUME /home

COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["composer"]
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3

ENV COMPOSER_VERSION "2.0.9"

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

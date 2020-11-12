FROM php:cli-alpine

WORKDIR /app

VOLUME /home

COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["composer"]
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394

ENV COMPOSER_VERSION "2.0.6"

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

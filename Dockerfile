FROM lucor/php7-cli:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

WORKDIR /app

VOLUME /home

COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["composer"]
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410

ENV COMPOSER_VERSION "1.4.1"

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

FROM lucor/php7-cli:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

WORKDIR /app

VOLUME /home

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959

ENV COMPOSER_VERSION 1.0.2

CMD ["/usr/local/bin/composer"]

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php
RUN php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) === getenv('COMPOSER_SETUP_SHA')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); echo PHP_EOL; exit(1); } echo PHP_EOL;"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN php -r "unlink('/tmp/composer-setup.php');"

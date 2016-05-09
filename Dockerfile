FROM lucor/php7-cli:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

WORKDIR /app

VOLUME /home

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938

ENV COMPOSER_VERSION "1.1.0-RC"

CMD ["/usr/local/bin/composer"]

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php
RUN php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) === getenv('COMPOSER_SETUP_SHA')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); echo PHP_EOL; exit(1); } echo PHP_EOL;"
#RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --preview
RUN php -r "unlink('/tmp/composer-setup.php');"

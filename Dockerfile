FROM lucor/php7-cli:latest

MAINTAINER Luca Corbo <lu.corbo@gmail.com>

WORKDIR /app

VOLUME /home

ENV COMPOSER_HOME /home/.composer

ENV COMPOSER_SETUP_SHA 070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d

ENV COMPOSER_VERSION "1.1.2"

CMD ["/usr/local/bin/composer"]

# Install Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > /tmp/composer-setup.php
RUN php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) === getenv('COMPOSER_SETUP_SHA')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); echo PHP_EOL; exit(1); } echo PHP_EOL;"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
#RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer --preview
RUN php -r "unlink('/tmp/composer-setup.php');"

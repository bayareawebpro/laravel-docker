FROM php:7.3-fpm
RUN apt-get update
RUN apt-get install -y apt-utils pkg-config
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

#=== Install Extensions ===============================================================#
# Zip
RUN apt-get update && apt-get install --no-install-recommends -y libzip-dev zip unzip
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip

# MySql
RUN apt-get update && apt-get install --no-install-recommends -y mysql-client-*
RUN docker-php-ext-install pdo_mysql

# Cryptography
RUN apt-get update && apt-get install --no-install-recommends -y libmcrypt-dev
RUN pecl install mcrypt-1.0.2

# Math (Telescope)
RUN docker-php-ext-install bcmath

# Imagick
RUN apt-get update && apt-get install --no-install-recommends -y libmagickwand-dev
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# Install xDebug
# RUN pecl install xdebug && docker-php-ext-enable xdebug
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

#=== Composer ================================================================#
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
RUN cd /root/ && curl -sS https://getcomposer.org/installer | php
RUN mv /root/composer.phar /usr/local/bin/composer

#=== NodeJs ==================================================================#
RUN apt-get install --no-install-recommends -y npm

#=== Clean Up ================================================================#
RUN apt autoremove && apt-get autoclean

#=== Respository =============================================================#
#RUN composer install APP_REPOSITORY;
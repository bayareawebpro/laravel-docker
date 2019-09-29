FROM php:7.3-fpm
RUN apt-get update
RUN apt-get install -y apt-utils pkg-config

#=== Install Extensions ===============================================================#

# Zip
RUN apt-get update && apt-get install --no-install-recommends -y libzip-dev zip unzip git
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

# OpCache
RUN docker-php-ext-install opcache

# Imagick
#RUN apt-get update && apt-get install --no-install-recommends -y libmagickwand-dev
#RUN pecl install imagick
#RUN docker-php-ext-enable imagick

# Install xDebug
# RUN pecl install xdebug && docker-php-ext-enable xdebug
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

#=== Composer ================================================================#
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
RUN cd /usr/local/bin/ && curl -sS https://getcomposer.org/installer | php
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer

#=== NodeJs ==================================================================#
RUN apt-get install --no-install-recommends -y npm
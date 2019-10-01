FROM php:7.3-fpm
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y apt-utils
RUN apt-get install -y pkg-config

#=== Install Extensions ===============================================================#
# https://gist.github.com/hoandang/88bfb1e30805df6d1539640fc1719d12

# Zip
RUN apt-get update && apt-get install -y libzip-dev zip unzip
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip

# Cryptography (Encrypter)
RUN apt-get update && apt-get install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.2
RUN docker-php-ext-enable mcrypt

# Redis
RUN pecl install redis
RUN docker-php-ext-enable redis

# Math (Telescope)
RUN docker-php-ext-install bcmath

# MySql
RUN apt-get update && apt-get install -y mysql-client-*
RUN docker-php-ext-install pdo pdo_mysql

# Sqlite
RUN apt-get update && apt-get install -y libsqlite3-dev
RUN docker-php-ext-install pdo pdo_sqlite

# OpCache
RUN docker-php-ext-install opcache

# Memcached
RUN apt-get install -y libmemcached-dev
RUN pecl install memcached
RUN docker-php-ext-enable memcached

# Imagick
RUN apt-get update && apt-get install --no-install-recommends -y libmagickwand-dev
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# Pcntl (Horizon)
RUN pecl channel-update pecl.php.net
RUN docker-php-ext-install pcntl

# Install xDebug
# RUN pecl install xdebug && docker-php-ext-enable xdebug
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

#=== Supervisor ==============================================================#
RUN apt-get install -y supervisor
RUN apt-get install -y procps
RUN mkdir -p /var/log/supervisor

#=== NodeJs ==================================================================#
RUN apt-get install --no-install-recommends -y npm

#=== Composer ================================================================#
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
RUN cd /usr/local/bin/ && curl -sS https://getcomposer.org/installer | php
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer

# GIT
RUN apt-get install -y git

# CleanUp
RUN apt-get autoremove

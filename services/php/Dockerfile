FROM php:7.3-fpm
RUN apt-get update
RUN apt-get install -y apt-utils pkg-config

#=== Install Extensions ===============================================================#

# Redis
RUN pecl install redis && docker-php-ext-enable redis

# MySql
RUN apt-get update && apt-get install -y mysql-client-*
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

# Sqlite
RUN apt-get update && apt-get install -y libsqlite3-dev
RUN docker-php-ext-install pdo pdo_sqlite
RUN docker-php-ext-enable pdo_sqlite

# Zip
RUN apt-get update && apt-get install -y libzip-dev zip unzip
RUN docker-php-ext-configure zip --with-libzip

# Cryptography (Encrypter)
RUN apt-get update && apt-get install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.2

# Math (Telescope)
RUN docker-php-ext-install bcmath

# OpCache
RUN docker-php-ext-install opcache

# Memcached
RUN apt-get install -y libmemcached-dev
RUN pecl install memcached
RUN docker-php-ext-enable memcached

# Imagick
#RUN apt-get update && apt-get install --no-install-recommends -y libmagickwand-dev
#RUN pecl install imagick
#RUN docker-php-ext-enable imagick

# Pcntl (Horizon)
RUN pecl channel-update pecl.php.net
RUN docker-php-ext-install pcntl

# Install xDebug
# RUN pecl install xdebug && docker-php-ext-enable xdebug
# COPY ./xdebug.ini /usr/local/etc/php/conf.d/

#=== Supervisor ================================================================#
RUN apt-get install -y supervisor
RUN apt-get install -y procps
RUN mkdir -p /var/log/supervisor
#CMD ["/usr/bin/supervisord"]

#=== NodeJs ==================================================================#
#RUN apt-get install --no-install-recommends -y npm

#=== Composer ================================================================#
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
RUN cd /usr/local/bin/ && curl -sS https://getcomposer.org/installer | php
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer

# GIT
RUN apt-get update && apt-get install -y git

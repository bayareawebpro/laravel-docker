FROM php:7.2-fpm

# Update Image
RUN apt-get update

# Install Zip Extensions
#RUN apt-get update && apt-get install -y zlib1g-dev zip unzip && docker-php-ext-install zip
RUN apt-get update && apt-get install --no-install-recommends -y libzip-dev zip unzip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip

# Install MySql Extensions
RUN apt-get update && apt-get install --no-install-recommends -y mysql-client && docker-php-ext-install pdo_mysql

# Install Cryptography Extensions
RUN apt-get update && apt-get install --no-install-recommends -y libmcrypt-dev && pecl install mcrypt-1.0.1

# Install Math Extensions
RUN docker-php-ext-install bcmath

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install --no-install-recommends -y pkg-config libmagickwand-dev -y && pecl install imagick
RUN docker-php-ext-enable imagick

# Install NodeJs
RUN apt-get update && apt-get install -y nodejs

# Install Composer
RUN cd /root/ && curl -sS https://getcomposer.org/installer | php
RUN mv /root/composer.phar /usr/local/bin/composer

# Set Composer Environent Variables
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

# Install the Laravel Installer
RUN composer global require "laravel/installer"

# Install xDebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
COPY ./xdebug.ini /usr/local/etc/php/conf.d/
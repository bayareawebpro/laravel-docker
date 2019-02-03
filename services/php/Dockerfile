FROM php:7.2-fpm

# Update Image
RUN apt-get update

# Install Zip Extensions
RUN apt-get update && apt-get install -y libzip-dev && docker-php-ext-install zip

# Install MySql Extensions
RUN apt-get update && apt-get install -y mysql-client && docker-php-ext-install pdo_mysql

# Install Cryptography Extensions
RUN apt-get update && apt-get install -y libmcrypt-dev && pecl install mcrypt-1.0.1

# Install Math Extensions
RUN docker-php-ext-install bcmath

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install -y && libmagickwand-dev --no-install-recommends
RUN pecl install imagick && docker-php-ext-enable imagick

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
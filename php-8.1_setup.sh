#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y \
  php-dev \
  php-pear \
  php8.1-bcmath \
  php8.1-bz2 \
  php8.1-cli \
  php8.1-curl \
  php8.1-fpm \
  php8.1-gd \
  php8.1-imagick \
  php8.1-intl \
  php8.1-mbstring \
  php8.1-mysql \
  php8.1-redis \
  php8.1-sqlite3 \
  php8.1-swoole \
  php8.1-tidy \
  php8.1-uuid \
  php8.1-xdebug \
  php8.1-xml \
  php8.1-xsl \
  php8.1-yaml \
  php8.1-zip

pear channel-update pear.php.net
pecl channel-update pecl.php.net
sudo pecl install --configureoptions 'enable-sockets="yes" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-swoole-json="yes" enable-swoole-curl="yes"' swoole

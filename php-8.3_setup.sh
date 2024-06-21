#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y \
  php-dev \
  php-pear \
  php8.3-bcmath \
  php8.3-bz2 \
  php8.3-cli \
  php8.3-curl \
  php8.3-fpm \
  php8.3-gd \
  php8.3-imagick \
  php8.3-intl \
  php8.3-mbstring \
  php8.3-mysql \
  php8.3-redis \
  php8.3-sqlite3 \
  php8.3-swoole \
  php8.3-tidy \
  php8.3-uuid \
  php8.3-xdebug \
  php8.3-xml \
  php8.3-xsl \
  php8.3-yaml \
  php8.3-zip

pear channel-update pear.php.net
pecl channel-update pecl.php.net
sudo pecl install --configureoptions 'enable-sockets="yes" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-swoole-json="yes" enable-swoole-curl="yes"' swoole

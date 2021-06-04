#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y \
  php-dev \
  php-pear \
  php8.0-bcmath \
  php8.0-bz2 \
  php8.0-cli \
  php8.0-curl \
  php8.0-fpm \
  php8.0-gd \
  php8.0-imagick \
  php8.0-intl \
  php8.0-mbstring \
  php8.0-mysql
  php8.0-redis \
  php8.0-sqlite3 \
  php8.0-tidy \
  php8.0-uuid \
  php8.0-xdebug \
  php8.0-xml \
  php8.0-xsl \
  php8.0-yaml \
  php8.0-zip \

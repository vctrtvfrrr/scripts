#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y \
  php7.4-fpm \
  php7.4-cli \
  php7.4-curl \
  php7.4-gd \
  php7.4-intl \
  php7.4-json \
  php7.4-mbstring \
  php7.4-mysql \
  php7.4-opcache \
  php7.4-sqlite3 \
  php7.4-tidy \
  php7.4-xml \
  php7.4-zip \
  php7.4-xsl

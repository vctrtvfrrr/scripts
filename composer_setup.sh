#!/bin/bash

sudo apt-get install -qq wget
wget https://getcomposer.org/composer.phar
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

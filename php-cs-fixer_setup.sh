#!/bin/bash

sudo apt-get install -yqq wget
wget -O php-cs-fixer.phar https://cs.symfony.com/download/php-cs-fixer-v2.phar
chmod +x php-cs-fixer.phar
sudo mv php-cs-fixer.phar /usr/local/bin/php-cs-fixer

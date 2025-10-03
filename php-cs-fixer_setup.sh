#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -yqq wget
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer

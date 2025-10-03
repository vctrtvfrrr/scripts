#!/usr/bin/env bash
set -euo pipefail

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
sudo apt-get install -y typora

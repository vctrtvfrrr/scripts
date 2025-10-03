#!/usr/bin/env bash
set -euo pipefail

FILE=/tmp/lsix
sudo apt-get install -y imagemagick
wget -O $FILE https://raw.githubusercontent.com/hackerb9/lsix/master/lsix
chmod +x $FILE
sudo mv $FILE /usr/local/bin/

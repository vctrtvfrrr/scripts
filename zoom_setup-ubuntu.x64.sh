#!/usr/bin/env bash
set -euo pipefail

FILE=/tmp/zoom_amd64.deb

sudo apt-get install -qq wget
wget -O $FILE https://www.zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i $FILE
sudo apt-get install -fyqq

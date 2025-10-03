#!/usr/bin/env bash
set -euo pipefail

FILE=/tmp/google-chrome.deb

sudo apt-get install -qq wget
wget -O $FILE https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i $FILE

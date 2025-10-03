#!/usr/bin/env bash
set -euo pipefail

echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list

sudo apt-get -yqq update
sudo apt-get -yqq install insomnia

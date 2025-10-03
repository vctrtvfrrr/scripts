#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -yqq wget
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo rm -f Release.key
sudo apt-get update -yqq
sudo apt-get install -yqq albert

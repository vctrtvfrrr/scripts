#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -yqq \
	g++ build-essential qt5-default qt5-qmake qttools5-dev-tools \
	libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev \
	git openssl ca-certificates

git clone https://github.com/lupoDharkael/flameshot.git /tmp/flameshot

cd /tmp/flameshot

mkdir build
cd build
sudo qmake ../
sudo make
sudo make install

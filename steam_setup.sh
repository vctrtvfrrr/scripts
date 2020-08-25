#!/bin/bash

FILE=/tmp/steam.deb

sudo apt-get install -qq wget
wget -O $FILE https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo dpkg -i $FILE

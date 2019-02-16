#!/bin/bash

FILE=/tmp/skype.deb

sudo apt-get install -qq wget
wget -O $FILE https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i $FILE
sudo apt-get install -fy

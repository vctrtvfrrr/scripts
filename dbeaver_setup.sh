#!/bin/bash

FILE=/tmp/dbeaver_setup.deb
sudo apt-get install -yqq wget
wget -O $FILE https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i $FILE

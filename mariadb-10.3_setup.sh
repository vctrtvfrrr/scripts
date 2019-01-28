#!/bin/bash

sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo apt-get install -y software-properties-common
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.3/ubuntu bionic main'
sudo apt-get update
sudo apt install -y mariadb-server

CONF_FILE=/etc/mysql/mariadb.cnf

sudo sed -i 's/utf8/utf8mb4/g' $CONF_FILE
sudo sed -i '/default-character-set/s/^#//g' $CONF_FILE
sudo sed -i '/character-set-server/s/^#//g' $CONF_FILE
sudo sed -i '/collation-server/s/^#//g' $CONF_FILE
sudo sed -i '/character_set_server/s/^#//g' $CONF_FILE
sudo sed -i '/collation_server/s/^#//g' $CONF_FILE

sudo systemctl restart mariadb

sudo mysql_secure_installation

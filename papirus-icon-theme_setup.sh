#!/bin/bash

sudo add-apt-repository -y ppa:papirus/papirus
sudo apt-get update
sudo apt-get install -yqq papirus-icon-theme gnome-tweak-tool
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

#!/bin/bash

sudo add-apt-repository -y ppa:papirus/papirus
sudo apt-get update
sudo apt-get install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

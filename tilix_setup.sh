#!/bin/bash

sudo apt-get install -yqq tilix nautilus-extension-gnome-terminal
sudo update-alternatives --config x-terminal-emulator
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

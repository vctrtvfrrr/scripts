#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y git python3 python3-pip
sudo git clone https://github.com/StevenBlack/hosts.git ~/.config/hosts
pip3 install --user -r ~/.config/hosts/requirements.txt
sudo python3 ~/.config/hosts/updateHostsFile.py --auto --replace --compress

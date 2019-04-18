#!/bin/bash

sudo apt install -y git python3-pip
sudo git clone https://github.com/StevenBlack/hosts.git /opt/hosts
sudo -H pip3 install --user -r /opt/hosts/requirements.txt
sudo -H python3 /opt/hosts/updateHostsFile.py --auto --replace --compress
#sudo crontab -l | { cat; echo "0 10 * * 4 /usr/bin/python3 /opt/hosts/updateHostsFile.py --auto --replace --compress"; } | sudo crontab -

#!/bin/bash

sudo apt-get install build-essential libssl-dev git -y

cd /tmp
git clone https://github.com/wg/wrk.git wrk
cd wrk
sudo make
sudo cp wrk /usr/local/bin

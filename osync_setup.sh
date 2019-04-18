#!/bin/bash

sudo apt-get install -yqq git
git clone -b "stable" https://github.com/deajan/osync /tmp/osync
sudo bash /tmp/osync/install.sh

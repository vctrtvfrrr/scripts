#!/usr/bin/env bash
set -euo pipefail

FILE=/tmp/minitube.deb
sudo apt-get install -yqq wget ubuntu-restricted-extras libavcodec54 libav-tools ffmpeg
wget -O $FILE https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8/+files/youtube-viewer_3.5.0-1~webupd8~bionic0_all.deb
sudo dpkg -i $FILE
sudo apt-get install -yqqf

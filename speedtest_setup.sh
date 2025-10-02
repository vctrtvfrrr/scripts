#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -yqq curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install -yqq speedtest-cli

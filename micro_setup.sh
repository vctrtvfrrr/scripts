#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y xclip
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin/

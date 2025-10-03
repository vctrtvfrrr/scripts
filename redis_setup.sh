#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -yqq redis-server
sudo systemctl enable redis-server.service

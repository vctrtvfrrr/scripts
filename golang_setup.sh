#!/usr/bin/env bash
set -euo pipefail

sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -yqq golang-go

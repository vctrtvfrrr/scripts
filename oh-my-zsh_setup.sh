#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y curl git zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

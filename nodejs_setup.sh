#!/usr/bin/env bash
set -euo pipefail

# Get the latest NVM version dynamically from GitHub
NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest \
  | grep '"tag_name":' \
  | sed -E 's/.*"v([^"]+)".*/\1/')

echo "Installing NVM v$NVM_VERSION..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash

# Load NVM into current session
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest LTS Node.js
echo "Installing latest Node.js LTS..."
nvm install --lts
nvm alias default 'lts/*'
nvm use default

echo "✅ NVM v$NVM_VERSION installed with Node.js $(node -v) (LTS)"

#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./install-monaspace.sh [variant] [--system]
# Examples:
#   ./install-monaspace.sh           # installs "static" variant to user's fonts (~/.local/share/fonts)
#   ./install-monaspace.sh frozen    # install frozen variant for user
#   sudo ./install-monaspace.sh nerdfonts --system  # install nerdfonts system-wide (requires sudo)

VARIANT="${1:-static}"
SYSTEM_INSTALL=false
if [[ "${2:-}" == "--system" || "${1:-}" == "--system" ]]; then
  SYSTEM_INSTALL=true
fi

REPO="githubnext/monaspace"
API_URL="https://api.github.com/repos/${REPO}/releases/latest"
TMPDIR="$(mktemp -d)"
ZIP_FILE="${TMPDIR}/monaspace.zip"
UNZIP_DIR="${TMPDIR}/monaspace-staging"

# Ensure basic tools
install_packages=()
for cmd in wget unzip fc-cache; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    install_packages+=("$cmd")
  fi
done

# Ensure curl for API access
if ! command -v curl >/dev/null 2>&1; then
  install_packages+=("curl")
fi

# jq is optional but preferred
USE_JQ=true
if ! command -v jq >/dev/null 2>&1; then
  USE_JQ=false
fi

if [ "${#install_packages[@]}" -ne 0 ]; then
  echo "Installing missing packages: ${install_packages[*]}"
  sudo apt-get update -y
  sudo apt-get install -y "${install_packages[@]}"
fi

echo "Fetching latest release info for ${REPO}..."
release_json="$(curl -sSL -H "Accept: application/vnd.github+json" "$API_URL")"
if [ -z "$release_json" ]; then
  echo "Failed to fetch release info from GitHub API." >&2
  exit 1
fi

# Find matching asset download URL for the requested VARIANT.
download_url=""
if $USE_JQ; then
  # Build pattern (case-insensitive) like "monaspace-.*<variant>.*\.zip"
  # We search assets[].browser_download_url for a matching name
  download_url=$(echo "$release_json" \
    | jq -r --arg pat "monaspace-.*${VARIANT}.*\\.zip" '
        .assets[]? | select((.name|test($pat; "i"))) | .browser_download_url' \
    | head -n1 || true)
else
  # Fallback: crude grep/sed parser
  download_url=$(echo "$release_json" \
    | grep -o '"browser_download_url": *"[^"]*"' \
    | sed -E 's/^[^"]*"browser_download_url": *"([^"]*)".*$/\1/' \
    | grep -iE "monaspace-.*${VARIANT}.*\\.zip" \
    | head -n1 || true)
fi

if [ -z "$download_url" ]; then
  echo "No asset matching variant '${VARIANT}' found in latest release." >&2
  echo "Available assets:" >&2
  if $USE_JQ; then
    echo "$release_json" | jq -r '.assets[]?.name'
  else
    echo "$release_json" | grep -o '"name": *"[^"]*"' | sed -E 's/^[^"]*"name": *"([^"]*)".*$/\1/'
  fi
  rm -rf "$TMPDIR"
  exit 1
fi

echo "Found asset for variant '${VARIANT}':"
echo "  $download_url"

echo "Downloading..."
wget -q --show-progress "$download_url" -O "$ZIP_FILE"

echo "Unpacking..."
mkdir -p "$UNZIP_DIR"
unzip -q "$ZIP_FILE" -d "$UNZIP_DIR"

# Where to copy fonts
if [ "$SYSTEM_INSTALL" = true ]; then
  DEST_DIR="/usr/local/share/fonts/monaspace"
  echo "Installing system-wide to $DEST_DIR (sudo may be used)."
  sudo mkdir -p "$DEST_DIR"
  # Copy fonts (ttf/otf) preserving permissions
  find "$UNZIP_DIR" -type f \( -iname '*.ttf' -o -iname '*.otf' \) -exec sudo cp -v {} "$DEST_DIR"/ \;
  sudo fc-cache -fv
else
  DEST_DIR="$HOME/.local/share/fonts/monaspace"
  mkdir -p "$DEST_DIR"
  find "$UNZIP_DIR" -type f \( -iname '*.ttf' -o -iname '*.otf' \) -exec cp -v {} "$DEST_DIR"/ \;
  fc-cache -fv
fi

echo "Installed Monaspace fonts to $DEST_DIR"
echo "Verification (fc-list entries):"
fc-list | grep -i monaspace || true

rm -rf "$TMPDIR"

echo "Done."

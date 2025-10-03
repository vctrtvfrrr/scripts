#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y xz-utils

SETUP_FILE=/tmp/postman.tar.gz
INSTALL_PATH=/opt/Postman
DESKTOP_ICON=$HOME/.local/share/applications/postman.desktop

if [ ! -f $SETUP_FILE ]; then
	wget -O $SETUP_FILE https://dl.pstmn.io/download/latest/linux64
fi

if [ ! -d $INSTALL_PATH ]; then
	tar -xzvf $SETUP_FILE -C /tmp
	sudo mv /tmp/Postman $INSTALL_PATH
fi

if [ ! -f $DESKTOP_ICON ]; then
	cat > $DESKTOP_ICON << EOF
[Desktop Entry]
Version=1.0
Name=Postman
Comment=The only complete API development environment
Exec=$INSTALL_PATH/Postman
Icon=postman
Terminal=false
Type=Application
X-GNOME-UsesNotifications=true
EOF
fi

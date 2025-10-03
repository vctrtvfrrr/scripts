#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y xz-utils

SETUP_FILE=/tmp/tsetup.tar.xz
INSTALL_PATH=/opt/Telegram
DESKTOP_ICON=$HOME/.local/share/applications/telegramdesktop.desktop

if [ ! -f $SETUP_FILE ]; then
	wget -O $SETUP_FILE https://telegram.org/dl/desktop/linux
fi

if [ ! -d $INSTALL_PATH ]; then
	tar -xvf $SETUP_FILE -C /tmp
	sudo mv /tmp/Telegram $INSTALL_PATH
fi

if [ ! -f $DESKTOP_ICON ]; then
	cat > $DESKTOP_ICON << EOF
[Desktop Entry]
Version=1.0
Name=Telegram Desktop
Comment=Official desktop version of Telegram messaging app
Exec=$INSTALL_PATH/Telegram -- %u
Icon=telegram
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;
X-GNOME-UsesNotifications=true
EOF
fi

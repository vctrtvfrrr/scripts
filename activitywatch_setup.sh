#!/bin/bash

sudo apt-get install -y zip unzip

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/ActivityWatch/activitywatch/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="https://github.com/ActivityWatch/activitywatch/releases/download/$LATEST_VERSION/activitywatch-$LATEST_VERSION-linux-x86_64.zip"

SETUP_FILE=/tmp/activitywatch.zip
INSTALL_PATH=/opt/ActivityWatch

if [ ! -f $SETUP_FILE ]; then
	wget -O $SETUP_FILE $ARTIFACT_URL
fi

if [ ! -d $INSTALL_PATH ]; then
	unzip $SETUP_FILE -d /tmp
	sudo mv /tmp/activitywatch $INSTALL_PATH
fi

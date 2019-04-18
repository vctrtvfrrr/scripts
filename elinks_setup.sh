#!/bin/bash

FOLDER=/tmp/elinks

sudo apt-get install -yqq build-essential git autotools-dev automake

git clone http://elinks.cz/elinks.git $FOLDER

cd $FOLDER

./autogen.sh
./configure
make
sudo make install

rm -fr $FOLDER

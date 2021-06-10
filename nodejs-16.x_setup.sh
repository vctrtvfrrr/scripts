#!/bin/bash

NPM_GLOBAL="${HOME}/.npm-global"
NODE_MODULES="${NPM_GLOBAL}/lib/node_modules"

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -yqq git nodejs

mkdir $NPM_GLOBAL
npm config set prefix "${NPM_GLOBAL}"

#sudo mv /usr/lib/node_modules $NODE_MODULES
#sudo chown -R $USER:$USER $NPM_GLOBAL

mkdir -p $NODE_MODULES
git clone https://github.com/npm/cli.git $NODE_MODULES/npm
rm -fr $NODE_MODULES/npm/.git

sudo rm -fr /usr/lib/node_modules
sudo ln -s $NODE_MODULES /usr/lib/node_modules

sudo rm -fr /usr/bin/npm
sudo ln -s $NODE_MODULES/npm/bin/npm-cli.js /usr/bin/npm
sudo rm -fr /usr/bin/npx
sudo ln -s $NODE_MODULES/npm/bin/npx-cli.js /usr/bin/npx

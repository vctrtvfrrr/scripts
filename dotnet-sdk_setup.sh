#!/bin/bash

# Register Microsoft key and feed
wget -q -O /tmp/packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb

# Install the .NET SDK
sudo add-apt-repository universe
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.2
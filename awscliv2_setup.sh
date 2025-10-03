#!/usr/bin/env bash
set -euo pipefail

FILE=/tmp/awscliv2.zip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $FILE
unzip $FILE -d /tmp
sudo /tmp/aws/install

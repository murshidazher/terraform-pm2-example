#!/bin/bash

set -eux -o

sudo yum update -y
sudo yum install -y git

# node
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 12.19.0
nvm use 12.19.0

# process managers
npm i -g forever
npm i -g pm2

# basic folders
mkdir -p ~/server-01
mkdir -p ~/server-02
mkdir -p ~/react

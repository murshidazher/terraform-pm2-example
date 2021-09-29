#!/bin/bash -xe

set -eux -o
sudo su -
cd ~

/usr/bin/apt-get update

DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq

/usr/bin/apt-get install default-jdk -y
/usr/bin/apt-get install jenkins -y

sudo apt-get install git -y

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

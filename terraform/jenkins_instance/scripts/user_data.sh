#!/bin/bash -xe
# https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04
sudo su -

cd ~

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
/usr/bin/wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
/bin/sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

/usr/bin/apt-get update

DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq

/usr/bin/apt-get install default-jdk -y
/usr/bin/apt-get install jenkins -y
/bin/systemctl start jenkins
/bin/systemctl status jenkins

/usr/bin/apt install python3-pip -y
pip3 install awscli
apt install unzip
wget -q https://releases.hashicorp.com/terraform/0.11.6/terraform_0.11.6_linux_amd64.zip
unzip terraform_0.11.6_linux_amd64.zip
mv terraform /usr/local/bin/terraform
terraform version

/usr/bin/apt-get install git -y

# install nodejs
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 12.19.0
nvm use 12.19.0

# open firewall (beware this script fails sometime so execute them manualy)
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

echo "----- End of Updates -----"

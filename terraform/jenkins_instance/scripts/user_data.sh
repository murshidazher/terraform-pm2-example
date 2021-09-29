#!/bin/bash -xe

sudo su -

cd ~

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
/usr/bin/wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
/bin/sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

/usr/bin/apt-get update

DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq

/usr/bin/apt-get install default-jdk -y
/usr/bin/apt-get install jenkins -y
/bin/systemctl start jenkins
/bin/systemctl status jenkins
/usr/sbin/ufw allow 8080
/usr/sbin/ufw status

/usr/bin/apt install python3-pip -y
pip3 install awscli
apt install unzip
wget -q https://releases.hashicorp.com/terraform/0.11.6/terraform_0.11.6_linux_amd64.zip
unzip terraform_0.11.6_linux_amd64.zip
mv terraform /usr/local/bin/terraform
terraform version

/usr/bin/apt-get install git -y

# install nodejs
curl -sL https://deb.nodesource.com/setup_12.19.0 -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
node -v

echo "----- End of Updates -----"

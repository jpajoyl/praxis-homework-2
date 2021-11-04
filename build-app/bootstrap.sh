#!/usr/bin/env bash

#install git
echo "Installing git..."
sudo yum install git -y

#install go
echo "Installing go..."
sudo yum install golang -y

#install node and npm
echo "Installing node..."
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install nodejs -y
source ~/.bash_profile
#install vue
echo "Installing vue..."
sudo npm install -g @vue/cli

# To verify correct installation
echo "Installed version of git"
git --version 
echo "Installed version of go"
go version
echo "Installed version of nodeJS"
node --version
echo "Installed version of npm"
npm --version
echo "Installed version of Vue"
vue --version

git clone https://github.com/jdmendozaa/vuego-demoapp.git

cd vuego-demoapp/server

go build -o /shared/server

# prepare frontend
cd ../spa/

sudo npm install

sudo echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' >> .env.production

sudo npm run build

tar -zcvf front.tar.gz ./dist

mv front.tar.gz /shared






echo "Builded app!"
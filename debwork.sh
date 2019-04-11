#!/bin/bash

if [ "$1" == "reset" ]; then
    ./linuxReset.sh downstage stage1
    apt  install -y -f /var/cache/apt/archives/*.deb
    apt -y install -f ./*.deb
    systemctl start mongod
    systemctl enable mongod
    npm i -g create-react-app
    passwd jamesshane
    ufw enable
    ufw allow 22
    exit 1
fi

apt update

apt -y upgrade

apt -y --download-only install wget

apt  install -y -f /var/cache/apt/archives/*.deb

wget https://jamesshane.github.com/linuxReset/linuxReset.sh

chmod +x linuxReset.sh

./linuxReset.sh makestage stage1

apt --download-only -y install gnome-core ufw vnc4server git 

apt install --download-only -y dirmngr --install-recommends

apt  install -y -f /var/cache/apt/archives/*.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.5.0/Simplenote-linux-1.5.0-amd64.deb

#apt install -y -f ./Simplenote-linux-1.5.0-amd64.deb

curl -sL https://deb.nodesource.com/setup_11.x | bash -

apt update

apt install --download-only -y nodejs

wget https://go.microsoft.com/fwlink/?LinkID=760868

mv index.html\?LinkID\=760868 code.deb

#apt install -y -f ./code.deb

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

apt update

apt install --download-only -y mongodb-org

apt -y install -f ./*.deb

systemctl start mongod

systemctl enable mongod

npm i -g create-react-app

passwd jamesshane

ufw enable

ufw allow 22


#!/bin/sh

wget https://jamesshane.github.com/linuxReset/linuxReset.sh

chmod +x linuxReset.sh

./linuxReset.sh makestage stage1

apt --download-only install gnome-core terminator ufw vnc4server git

apt  install -f /var/cache/apt/archives/*.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.5.0/Simplenote-linux-1.5.0-amd64.deb

apt install -f ./Simplenote-linux-1.5.0-amd64.deb

curl -sL https://deb.nodesource.com/setup_11.x | bash -

apt install -y nodejs

wget https://go.microsoft.com/fwlink/?LinkID=760868

mv index.html\?LinkID\=760868 code.deb

apt install -f ./code.deb

passwd jamesshane

ufw enable

ufw allow OpenSSH

apt-get install dirmngr --install-recommends

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

apt update

apt-get install -y mongodb-org

systemctl start mongod

systemctl enable mongod

npm i -g create-react-app
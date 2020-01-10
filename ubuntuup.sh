#!/bin/bash

if [ "$1" == "" ]; then
        echo "update X i3 gnome omz neofetch"
fi


if [ "$1" == "update" ]; then
	sudo apt update -y
	sudo apt upgrade -y
fi

if [ "$1" == "X" ]; then
        sudo apt install xorg xinit xterm nomacs gcc make perl -y        
        sudo apt install terminator firefox-esr -y
        sudo apt install software-properties-common apt-transport-https wget -y
        sudo apt install linux-headers-$(uname -r) -y
fi
#virtualbox-guest-utils 

if [ "$1" == "i3" ]; then
        sudo apt install i3 terminator firefox dmenu thunar -y
        #echo "exec i3" > /home/v/.xinitrc
        #chown v:v /home/v/.xinitrc
fi

if [ "$1" == "gnome" ]; then
	sudo apt install gdm3 gnome-terminal -y
fi

if [ "$1" == "omz" ]; then
        sudo apt install git -y
        sudo apt install zsh wget -y
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        sed -i 's/robbyrussell/junkfood/g' ~/.zshrc
fi


if [ "$1" == "fixclock" ]; then
	#fix
	echo "don't need this... it's on, if clock is wrong, correct the /etc/localtime and reboot"
        #sudo apt install ntp -y
        #sudo ntpd -qg
        #sudo systemctl enable ntpd.service
        #sudo systemctl enable ntpd
fi

if [ "$1" == "neofetch" ]; then
	sudo add-apt-repository ppa:dawidd0811/neofetch-daily
  sudo apt update
  sudo apt install neofetch
	echo "neofetch" >> ~/.zshrc
fi

if [ "$1" == "full" ]; then
  #./devprep admin
  ./ubuntuup.sh update
  ./ubuntuup.sh X
  ./ubuntuup.sh i3
  ./ubuntuup.sh gnome
fi


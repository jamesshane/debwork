#!/bin/bash

if [ "$1" == "" ]; then
        echo "admin update X i3 gnome gdmon omz dev fixclock neofetch"
fi


if [ "$1" == "update" ]; then
	sudo apt update -y
	sudo apt upgrade -y
fi

if [ "$1" == "X" ]; then
        sudo apt install xorg xinit xterm virtualbox-guest-utils nomacs -y        
        sudo apt install terminator firefox-esr -y
        sudo apt install software-properties-common apt-transport-https wget -y
fi

if [ "$1" == "i3" ]; then
        sudo apt install i3 terminator firefox dmenu thunar -y
        echo "exec i3" > /home/v/.xinitrc
        chown v:v /home/v/.xinitrc
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
  ./devprep.sh update
  ./devprep.sh X
  ./devprep.sh i3
  ./devprep.sh gnome
fi


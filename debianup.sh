#!/bin/bash

if [ "$1" == "" ]; then
        echo "full"
fi

if [ "$1" == "sudo" ]; then
	apt update -y
        apt install sudo -y
        adduser j sudo
fi

if [ "$1" == "update" ]; then
	sudo apt update -y
	sudo apt upgrade -y
fi

if [ "$1" == "X" ]; then
        sudo apt install xorg xinit -y
fi

if [ "$1" == "vmdev" ]; then
        sudo apt install gcc make perl -y
        sudo apt install linux-headers-$(uname -r) -y
fi

if [ "$1" == "xapps" ]; then
        sudo apt install tmux lilyterm htop tigervnc-viewer stress cmatrix vis -y
fi

if [ "$1" == "i3" ]; then
        sudo apt install i3 terminator firefox-esr chromium dmenu thunar dwm -y
fi

if [ "$1" == "i3gc" ]; then
        ./$0 i3
        vncserver 
        vncserver -kill :1
        rm ~/.vnc/xstartup
        echo -e "#"'!'"/bin/bash\n\dwm &" > ~/.vnc/xstartup
        chmod +x ~/.vnc/xstartup
fi

if [ "$1" == "lightdm" ]; then
	sudo apt install lightdm -y
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
fi

if [ "$1" == "neofetch" ]; then
	#sudo add-apt-repository ppa:dawidd0811/neofetch-daily
        #sudo apt update
        sudo apt install neofetch -y
	echo "neofetch" >> ~/.zshrc
fi

if [ "$1" == "snap" ]; then
        sudo apt install snapd -y
	sudo snap install discord
        sudo snap install code --classic
        sudo snap install simplenote
        #sudo snap install stickynotes
        sudo snap install cordless
        sudo snap install google-cloud-sdk
        echo -e "export PATH=$PATH:/snap/bin" >> ~/.xsessionrc
fi

if [ "$1" == "full" ]; then
        ./$0 update
        ./$0 X
        ./$0 i3
        ./$0 lightdm
        ./$0 vmdev
        ./$0 omz
        ./$0 neofetch
        ./$0 snap
        ./$0 xapps
fi

if [ "$1" == "fullgc" ]; then
        ./$0 update
        ./$0 X
        ./$0 i3gc
        #./$0 lightdm
        #./$0 vmdev
        #./$0 omz
        #./$0 neofetch
        ./$0 snap
        ./$0 xapps
fi

if [ "$1" == "desktop" ]; then
        ./$0 update
        #./$0 X
        ./$0 i3
        ./$0 lightdm
        ./$0 vmdev
        ./$0 omz
        ./$0 neofetch
        ./$0 snap
        ./$0 xapps
fi


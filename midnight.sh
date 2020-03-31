#!/bin/bash

#cc33ff - purple

if [ "$1" == "" ]; then
echo "full fullmin fulldev dev update X i3 lightdm vmdev snap omz omb neofetch xapps lamp mydevnode mydevmongo mydevyarn vncserverxfce vncserverdwm vncserverwmii gitprep min(dwm) ultratiny(i3) ultratinydwm(dwm) ultratinywmii(wmii) docker dockerwminstall midnightdockerinstall dockerx"
fi

if [ "$1" == "update" ]; then
	sudo apt update -y
	sudo apt upgrade -y
fi

if [ "$1" == "updatethis" ]; then
	sudo cp $0 /usr/local/bin/
	#sudo apt upgrade -y
fi

if [ "$1" == "X" ]; then
        sudo apt install xubuntu-desktop -y
fi

if [ "$1" == "gitprep" ]; then
        git config --global user.name "James Shane"
        git config --global user.email "jamesshane@gmail.com"
        git config --global credential.helper store
fi

if [ "$1" == "Xmin" ]; then
        sudo apt install xinit xorg -y 
fi

if [ "$1" == "vmdev" ]; then
        sudo apt install gcc make perl -y
        sudo apt install linux-headers-$(uname -r) -y
fi

if [ "$1" == "xapps" ]; then
        sudo apt install tmux terminator chromium-browser lilyterm htop tigervnc-viewer stress cmatrix curl vim git -y
fi

if [ "$1" == "i3" ]; then
        #sudo apt install i3 terminator firefox chromium-browser dmenu thunar dwm -y
        sudo add-apt-repository ppa:kgilmer/speed-ricer -y
        sudo add-apt-repository ppa:aacebedo/libi3ipc-glib -y
        sudo add-apt-repository ppa:aacebedo/xfce4-i3-workspaces-plugin -y
        sudo apt-get update
        sudo apt install i3-gaps libi3ipc-glib xfce4-i3-workspaces-plugin rofi dwm nitrogen firefox terminology -y
fi

if [ "$1" == "dwm" ]; then
#        sudo add-apt-repository ppa:niko2040/e19 -y
#        sudo add-apt-repository ppa:enlightenment-git/ppa -y
#        sudo apt-get update enlightenment
        #sudo apt-get install -y
        sudo apt install dwm dmenu firefox -y
        echo -e "exec dwm" > .xinitrc
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

if [ "$1" == "omb" ]; then
        sudo apt install git -y
        sudo apt install wget -y
        sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
        sed -i 's/font/zork/g' ~/.bashrc
        echo -e "\nxhost +si:localuser:jamesshane\n" ~/.bashrc
fi

if [ "$1" == "fixclock" ]; then
	#fix
	echo "don't need this... it's on, if clock is wrong, correct the /etc/localtime and reboot"
fi

if [ "$1" == "neofetch" ]; then
	sudo add-apt-repository ppa:dawidd0811/neofetch-daily -y
        sudo apt update
        sudo apt install neofetch
	#echo "neofetch" >> ~/.zshrc
fi

if [ "$1" == "snap" ]; then
	sudo snap install discord
        sudo snap install code --classic
        sudo snap install simplenote
        sudo snap install cordless
        sudo snap install google-cloud-sdk --classic
fi

if [ "$1" == "snapfast" ]; then
	sudo snap install discord
        sudo snap install code --classic
        sudo snap install docker
        sudo snap install docker-compose
fi

if [ "$1" == "lamp" ]; then
        sudo apt-get install -y build-essential
        sudo apt install apache2 apache2-utils -y
        #sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
        sudo chown www-data:www-data /var/www/html/ -R
        sudo apt install mariadb-server mariadb-client
        sudo mysql_secure_installation
        sudo apt install php7.2 libapache2-mod-php7.2 php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-curl -y
        sudo a2enmod php7.2
        sudo systemctl restart apache2
        echo -e "<?php phpinfo(); ?>" > info.php
        sudo mv info.php /var/www/html/
        sudo a2dismod php7.2
        sudo apt install php7.2-fpm -y
        sudo a2enmod proxy_fcgi setenvif
        sudo a2enconf php7.2-fpm
        sudo systemctl restart apache2
fi

if [ "$1" == "docker" ]; then
        sudo apt install build-essential xserver-xephyr docker.io -y
        sudo usermod -aG docker $USER
fi

if [ "$1" == "mydevnode" ]; then
        sudo apt-get install -y build-essential
        curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
        sudo apt-get install -y nodejs
fi

if [ "$1" == "mydevmongo" ]; then
        sudo apt-get install -y build-essential
        sudo apt-get install gnupg -y 
        wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
        echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
        sudo apt-get update
        sudo apt-get install -y mongodb-org
fi

if [ "$1" == "mydevyarn" ]; then
        sudo apt-get install -y build-essential
        curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt-get update && sudo apt-get install yarn -y
fi

if [ "$1" == "vncserverxfce" ]; then
        sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension -y
        echo -e "\nPassword for vncserver:\n";
        vncserver 
        vncserver -kill :1
        rm ~/.vnc/xstartup
        #echo -e "#"'!'"/bin/bash\n\nwmii &" > ~/.vnc/xstartup
        echo -e "#"'!'"/bin/bash\nxrdb $HOME/.Xresources\nstartxfce4 &" > ~/.vnc/xstartup
        chmod +x ~/.vnc/xstartup
        #sudo snap install simplenote && wmii
        #sed -i 's/4/1/' .wmii/wmiirc_local
        vncserver
fi

if [ "$1" == "vncserverdwm" ]; then
        sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension -y
        echo -e "\nPassword for vncserver:\n";
        vncserver 
        vncserver -kill :1
        rm ~/.vnc/xstartup
        echo -e "#"'!'"/bin/bash\n\dwm &" > ~/.vnc/xstartup
        chmod +x ~/.vnc/xstartup
        vncserver
fi

if [ "$1" == "vncserverwmii" ]; then
        sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension -y
        echo -e "\nPassword for vncserver:\n";
        vncserver 
        vncserver -kill :1
        rm ~/.vnc/xstartup
        echo -e "#"'!'"/bin/bash\n\nwmii &" > ~/.vnc/xstartup
        chmod +x ~/.vnc/xstartup
        wmii
        sed -i 's/4/1/' .wmii/wmiirc_local
        vncserver
fi

if [ "$1" == "ultratiny" ]; then
        sudo apt install xinit xorg i3 git firefox terminology linux-headers-$(uname -r) gcc perl make x11-xserver-utils snapd xserver-xephyr docker.io -y
        sudo usermod -aG docker $USER
        sudo snap install code --classic
        reboot
fi

if [ "$1" == "ultratinydwm" ]; then
        sudo apt install xinit xorg dwm git firefox terminology linux-headers-$(uname -r) gcc perl make x11-xserver-utils snapd xserver-xephyr docker.io -y
        sudo usermod -aG docker $USER
        sudo snap install code --classic
        reboot
fi

if [ "$1" == "ultratinywmii" ]; then
        sudo apt install xinit xorg wmii git firefox terminology linux-headers-$(uname -r) gcc perl make x11-xserver-utils snapd xserver-xephyr docker.io -y
        echo -e "exec wmii" > .xinitrc
        sudo usermod -aG docker $USER
        sudo snap install code --classic
        reboot
fi

if [ "$1" == "dockerwminstall" ]; then
        git clone https://github.com/csicar/dockerwm.git
        cd dockerwm
        docker build -t csicar/dockerwm .
        Xephyr :10 -ac -br -screen 1024x768 -resizeable -reset -terminate &
        docker container run --name mate --detach -it -e DISPLAY=:10 --device /dev/snd -v /dev/shm:/dev/shm -v /tmp/.X11-unix:/tmp/.X11-unix csicar/dockerwm /usr/bin/mate-session
fi

if [ "$1" == "midnightdockerinstall_old" ]; then
        git clone https://github.com/jamesshane/dockermidnight.git
        cd dockermidnight
        docker build -t midnightgrey .
        Xephyr :10 -ac -br -screen 1024x768 -resizeable -reset -terminate &
        docker container run --name midg --detach -it -e DISPLAY=:10 --privileged=true --device /dev/snd -v /var/run/docker.sock:/var/run/docker.sock -v /dev/shm:/dev/shm -v /tmp/.X11-unix:/tmp/.X11-unix midnightgrey /usr/bin/xfce4-session
fi

if [ "$1" == "midnightdockerinstall" ]; then
        #git clone https://github.com/jamesshane/dockermidnight.git
        #cd dockermidnight
        #docker build -t midnightgrey .
        Xephyr :10 -ac -br -screen 1024x768 -resizeable -reset -terminate &
        docker container run --name midg --detach -it -e DISPLAY=:10 --privileged=true --device /dev/snd -v /var/run/docker.sock:/var/run/docker.sock -v /dev/shm:/dev/shm -v /tmp/.X11-unix:/tmp/.X11-unix jamesshane/midnightgrey /usr/bin/xfce4-session
fi

if [ "$1" == "dockerx" ]; then
        Xephyr :10 -ac -br -screen 1024x768 -resizeable -reset -terminate &
fi

if [ "$1" == "powerline" ]; then
        sudo apt-get install python-pip git
        sudo su -c 'pip install git+git://github.com/Lokaltog/powerline'
                #in .profile
                #if [ -d "$HOME/.local/bin" ]; then
                #        PATH="$HOME/.local/bin:$PATH"
                #fi
        wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
        sudo mv PowerlineSymbols.otf /usr/share/fonts/
        sudo fc-cache -vf
        sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
                #in .vimrc
                #set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
                #
                #" Always show statusline
                #set laststatus=2
                #
                #" Use 256 colours (Use this setting only if your terminal supports 256 colours)
                #set t_Co=256
                #in .bashrc
                #if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
                #        source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
                #fi
                #in .zshrc
                #if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
                #        source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
                #fi
                #in .tmux.conf
                #source /usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf
                #set-option -g default-terminal "screen-256color"
        sudo sh -c 'pip install powerline-gitstatus'
                #in /usr/local/lib/python2.7/dist-packages/powerline/config_files/colorschemes/default.json
                #"gitstatus":                 { "fg": "gray8",           "bg": "gray2", "attrs": [] },
                #"gitstatus_branch":          { "fg": "gray8",           "bg": "gray2", "attrs": [] },
                #"gitstatus_branch_clean":    { "fg": "green",           "bg": "gray2", "attrs": [] },
                #"gitstatus_branch_dirty":    { "fg": "gray8",           "bg": "gray2", "attrs": [] },
                #"gitstatus_branch_detached": { "fg": "mediumpurple",    "bg": "gray2", "attrs": [] },
                #"gitstatus_tag":             { "fg": "darkcyan",        "bg": "gray2", "attrs": [] },
                #"gitstatus_behind":          { "fg": "gray10",          "bg": "gray2", "attrs": [] },
                #"gitstatus_ahead":           { "fg": "gray10",          "bg": "gray2", "attrs": [] },
                #"gitstatus_staged":          { "fg": "green",           "bg": "gray2", "attrs": [] },
                #"gitstatus_unmerged":        { "fg": "brightred",       "bg": "gray2", "attrs": [] },
                #"gitstatus_changed":         { "fg": "mediumorange",    "bg": "gray2", "attrs": [] },
                #"gitstatus_untracked":       { "fg": "brightestorange", "bg": "gray2", "attrs": [] },
                #"gitstatus_stashed":         { "fg": "darkblue",        "bg": "gray2", "attrs": [] },
                #"gitstatus:divider":         { "fg": "gray8",           "bg": "gray2", "attrs": [] }
                #in /usr/local/lib/python2.7/dist-packages/powerline/config_files/themes/shell/default_leftonly.json
                # {
                #        "function": "powerline_gitstatus.gitstatus",
                #        "priority": 40
                #},
                #in /usr/local/lib/python2.7/dist-packages/powerline/config_files/config.json
                # {
                #"ext": {
                #        "shell": {
                #                "theme": "default_leftonly"
                #                }
                #        }
                #}
  
fi

if [ "$1" == "full" ]; then
        ./$0 update
        ./$0 X
        ./$0 i3
        #./$0 lightdm
        ./$0 vmdev
        ./$0 snap
        ./$0 omz
        ./$0 neofetch
        ./$0 xapps
        #./$0 lamp
fi

if [ "$1" == "min" ]; then
        ./$0 update
        ./$0 Xmin
        ./$0 dwm
        #./$0 lightdm
        ./$0 vmdev
        #./$0 snap
        #./$0 omz
        #./$0 neofetch
        #./$0 xapps
fi

if [ "$1" == "fulldev" ]; then
        ./$0 update
        ./$0 X
        ./$0 i3
        #./$0 lightdm
        ./$0 vmdev
        ./$0 snap
        ./$0 omz
        ./$0 neofetch
        ./$0 xapps
        ./$0 lamp
        ./$0 mydevnode
        ./$0 mydevmongo
        ./$0 mydevyarn
fi

if [ "$1" == "dev" ]; then
        ./$0 update
        ./$0 lamp
        ./$0 mydevnode
        ./$0 mydevmongo
        ./$0 mydevyarn
fi

if [ "$1" == "desktopgc" ]; then
        ./$0 update
        ./$0 X
        #./$0 i3
        #./$0 lightdm
        #./$0 vmdev
        ./$0 snap
        #./$0 omz
        #./$0 neofetch
        ./$0 xapps
        #./$0 lamp
fi

if [ "$1" == "desktop" ]; then
        ./$0 update
        #./$0 X
        ./$0 i3
        ./$0 lightdm
        #./$0 vmdev
        #./$0 snap
        #./$0 omz
        #./$0 neofetch
        ./$0 xapps
        #./$0 lamp
fi

if [ "$1" == "midnghtbaseinstall" ]; then
        ./$0 update
        ./$0 vmdev
        ./$0 docker
fi


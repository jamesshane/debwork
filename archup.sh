#!/bin/bash


if [ "$1" == "update" ]; then
    sudo pacman -Syu 
    sudo reflector --country 'United States' --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
fi

if [ "$1" == "stage1" ]; then
    fdisk /dev/sda
    mkfs.ext4 /dev/sda1
    mount /dev/sda1 /mnt
    pacstrap /mnt/ base base-devel linux linux-firmware
    genfstab /mnt >> /mnt/etc/fstab
    cp $0 /mnt/
    arch-chroot /mnt
    reboot
fi

if [ "$1" == "stage2" ]; then
    pacman -S vi
    vi /etc/locale.gen
    locale-gen
    echo "LANG=en_US.UTF-8"  > /etc/locale.conf
    hwclock --systohc --utc
    echo "zathras" >> /etc/hostname
    echo "zathras" >> /etc/hosts
    passwd
    pacman -S grub dhcpcd git wget reflector
    grub-install /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg
    exit 1
fi

if [ "$1" == "network" ]; then
    systemctl start dhcpcd@enp0s3.service
    systemctl enable dhcpcd@enp0s3.service
    reboot
fi

if [ "$1" == "user" ]; then
    useradd -m -g users -G wheel -s /bin/bash j
    passwd j
    visudo
fi

if [ "$1" == "X" ]; then
    sudo pacman -S xorg xorg-xinit mesa xorg-apps ttf-dejavu terminator thunar chromium firefox
fi

if [ "$1" == "i3" ]; then
    sudo pacman -S i3 
    echo -e "#"'!'"/bin/bash\n\nexec i3" > ~/.xinitrc
fi

if [ "$1" == "lightdm" ]; then
    sudo pacman -S lightdm
    sudo pacman -S lightdm-gtk-greeter
    sudo systemctl enable lightdm.service
    echo "xrandr --size 1680x1050" > Xsetup
    sudo mv Xsetup /etc/lightdm/
    sudo chmod +x /etc/lightdm/Xsetup
    sudo vi /etc/lightdm/lightdm.conf
    reboot
fi

if [ "$1" == "fixclock" ]; then
	sudo pacman -S ntp
	sudo ntpd -qg
	sudo systemctl enable ntpd.service
	sudo systemctl enable ntpd
fi

if [ "$1" == "yaourt" ]; then
	git clone https://aur.archlinux.org/package-query.git
	cd package-query
	makepkg -si
	cd ..
	git clone https://aur.archlinux.org/yaourt.git
	cd yaourt
	makepkg -si
	cd ..
fi

if [ "$1" == "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
fi

if [ "$1" == "apps" ]; then
	yay -S discord
    yay -S code 
    yay -S simplenote
fi

if [ "$1" == "appsold" ]; then
    sudo pacman -Syu
    #sudo pacman -S --needed base-devel
    sudo pacman -S --needed xorg xorg-xinit virtualbox-guest-utils mesa xorg-serer-utils ttd-dejavu
    git clone git://git.suckless.org/dmenu
    cd dmenu
    make
    sudo make install
    cd ..
    git clone git://git.suckless.org/dwm
    cd dwm
    make
    sudo make install
    cd ..
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    yay -S simplenote
    echo -e "#"'!'"/bin/bash\n\nexec dwm" > ~/.xinitrc
    exit 1
fi

if [ "$1" == "appsgcp" ]; then
    sudo pacman -Syu
    sudo pacman -S base-devel
    sudo pacman -S xorg xorg-xinit terminator firefox git linux-headers tigervnc
    git clone git://git.suckless.org/dmenu
    cd dmenu
    make
    sudo make install
    cd ..
    git clone git://git.suckless.org/dwm
    cd dwm
    make
    sudo make install
    cd ..
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    yay -S simplenote
    echo -e "#"'!'"/bin/bash\n\nexec dwm" > ~/.xinitrc
    vncserver
    vncserver -kill :1 
    rm ~/.vnc/xstartup
    echo -e "#"'!'"/bin/bash\n\nexec dwm" > ~/.vnc/xstartup
    chmod +x ~/.vnc/xstartup
    exit 1
fi

if [ "$1" == "larbs" ]; then
    curl -LO larbs.xyz/larbs.sh
    bash larbs.sh
    exit 1
fi

if [ "$1" == "vboxold" ]; then
    echo -e "\nLoad guest installs in vbox:\n"
    read 
    pacman -S virtualbox-guest-iso linux-headers
    mount /dev/cdrom /mnt
    cd /mnt
    ./VBoxLinuxAdditions.run
    reboot
fi

if [ "$1" == "vbox" ]; then
    sudo pacman -S virtualbox-guest-utils
    reboot
fi

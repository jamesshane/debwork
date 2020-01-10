#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install xinit wmii tightvncserver xfonts-base lilyterm firefox tmux vim x11-xserver-utils --no-install-recommends -y

wmii
sed -i 's/4/1/' .wmii/wmiirc_local


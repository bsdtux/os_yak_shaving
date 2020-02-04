#!/bin/sh

su -m root -c 'pkg install -y git-lite vim zsh doas xorg nvidia-driver nvidia-settings nvidia-xconfig'
su -m root -c 'cp ./doas.conf /usr/local/etc/doas.conf'

mkdir -p $HOME/src

if [ ! -d $HOME/src/dwm ]; then
	git clone git://git.suckless.org/dwm $HOME/src/dwm
fi

if [ ! -d $HOME/src/st ]; then
	git clone git://git.suckless.org/st $HOME/src/st
fi

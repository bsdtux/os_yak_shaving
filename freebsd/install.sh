#!/bin/sh

su -m root -c 'pkg install -y git-lite vim zsh doas xorg nvidia-driver nvidia-settings nvidia-xconfig'
su -m root -c 'cp ./doas.conf /usr/local/etc/doas.conf'

if [ ! -d $HOME/src ]; then
	mkdir -p $HOME/src
fi

if [ ! -d $HOME/src/dwm ]; then
	git clone git://git.suckless.org/dwm $HOME/src/dwm
fi

if [ ! -d $HOME/src/st ]; then
	git clone git://git.suckless.org/st $HOME/src/st
fi

if [ "$SHELL" != "/usr/local/bin/zsh" ]; then
	chsh -s /usr/local/bin/zsh
fi

su -m root -c 'sysrc linux_enable="YES"'

if [ ! -f $HOME/.zshrc ]; then
	cp ./.zshrc $HOME/.zshrc
fi

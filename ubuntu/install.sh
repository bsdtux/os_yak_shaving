#!/bin/sh

# Install git and vim
sudo apt install -y git vim curl wget zsh fonts-powerline make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install Spotify
sudo snap install --classic spotify

# Install visual studio code
sudo snap install --classic code

# Install slack
sudo snap install --classic slack

# Install oh-my-zsh
which zsh
if [ $? -eq 0 -a ! -f $HOME/.zshrc ]; then	
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d $HOME/.pyenv ]; then
	curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
	echo 'export PATH="/home/jstephens/.pyenv/bin:$PATH"' >> $HOME/.zshrc
	echo 'eval "$(pyenv init -)"' >> $HOME/.zshrc
	echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.zshrc

	. ~/.zshrc
	pyenv install 3.7.5
fi


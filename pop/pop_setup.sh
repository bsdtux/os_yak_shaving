#!/bin/sh

echo "Setup git global"
git config --global user.name "Josh Stephens"
git config --global user.email "bsdtux@gmail.com"

echo "Installing ZSH"
sudo apt update; sudo apt install -y zsh

echo "Installing OH MY ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Pyenv"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo "Installing Required pyenv files"
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo "Adding pyenv init to .zshrc"
cat <<'EOF' >> ~/.zshrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

sudo apt install -y flatpak
flatpak install dropbox

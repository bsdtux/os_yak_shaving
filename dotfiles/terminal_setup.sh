#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ./tmux.conf $HOME/.tmux.conf
ln -sf ./zshrc $HOME/.zshrc
ln -sf ./nvim $HOME/.config/nvim

mkdir -p $HOME/.fonts
cp -r ./*.ttf $HOME/.fonts/


#!/usr/bin/env sh

echo "Installing Xcode command line utils"
xcode-select --install

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install Tmux"
brew install tmux

echo "Installing TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing NeoVim"
brew install neovim

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc ~/.zshrc

source ~/.zshrc

echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../dotfiles/zshrc ~/.zshrc
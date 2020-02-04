#!/usr/bin/env sh

echo "Installing Xcode command line utils"
xcode-select --install

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing zshrc file"
cp ./.zshrc ~/

echo "Sourcing zshrc file"
. ~/.zshrc

echo "Installing bundles"
brew bundle

pyenv install 3.6.6
pyenv install 3.7.5

pyenv global 3.7.5

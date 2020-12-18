#!/bin/sh

set -e

INITAL=false
SPOTIFY=false
DEVELOPMENT=false
OHMYZSH=false
SLACK=false
POWERLEVEL10K=false
MY_SHELL='zsh'
CONFIG=""

show_help() {
	cat << EOT
usage: install.sh [--all] [--initial] [--dev] [--ohmyzsh] [--spotify] [--slack] [--powerlevel10k] [--help]

--all
  turns on all options during installation

--initial
  Install initial packages

--dev
  Install dev environment

--ohmyzsh
  Install oh-my-zsh

--spotify
  Install spotify

--slack
  Install slack

--powerlevel10k
  Install Powerlevel10k font bar

EOT
}

get_shell_config() {
  if [ "$MY_SHELL" = "zsh" ]; then
	  CONFIG="$HOME/.zshrc"
  else
	  CONFIG="$HOME/.zshrc"
  fi
}


while :; do
	case $1 in
		-h|-\?|--help)
			show_help
			exit
			;;
		--all)
			INITIAL=true
			SPOTIFY=true
			DEVELOPMENT=true
			SLACK=true
			POWERLEVEL10K=true
			;;
		--initial)
			INITIAL=true
			;;
		--dev)
			DEVELOPMENT=true
			;;
		--ohmyzsh)
			OHMYZSH=true
			;;
		--spotify)
			SPOTIFY=true
			;;
		--slack)
			SLACK=true
			;;
		--powerlevel10k)
			POWERLEVEL10K=true
			;;
		--)
			shift
			break
			;;
		-?*)
			printf 'Unknown option (ignored): %s\n' "$1"  >&2
			;;
		*)
			break
	esac
	shift
done


get_shell_config

if [ "$INITIAL" = true ]; then
	sudo dnf upgrade -y
	sudo dnf install -y zsh util-linux-user vim flatpak wget curl yarnpkg
fi

if [ "$OHMYZSH" = true ]; then
	echo "Installing oh-my-zsh....."
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ "$DEVELOPMENT" = true ]; then
	echo "Creating backup of shell config file....."
	cp $CONFIG $CONFIG.bkup

	echo "Installing Pyenv....."
	sudo dnf install -y make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz
	if [ ! -d "$HOME/.pyenv" ]; then
		curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
	fi
	
	echo "# Pyenv Shims" >> "$CONFIG"
	echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> "$CONFIG"
	echo 'eval "$(pyenv init -)"' >> "$CONFIG"
	echo 'eval "$(pyenv virtualenv-init -)"' >> "$CONFIG"
	echo "" >> "$CONFIG"

	echo "Installing nvm....."
	if [ ! -d "$HOME/.nvm" ]; then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
	fi

	echo "# Nvm Shims" >> "$CONFIG"
	echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> "$CONFIG"
	echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> "$CONFIG"

	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	sudo dnf check-update
	sudo dnf install -y code

fi

if [ "$SPOTIFY" = true ]; then
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo flatpak install -y --noninteractive flathub com.spotify.Client
fi

if [ "$SLACK" = true ]; then
	sudo flatpak install -y --noninteractive flathub com.slack.Slack
fi

if [ "$POWERLEVEL10K" = true ]; then
	echo "Installing nerd-fonts....."
	git clone --depth=1 https://github.com/romkatv/nerd-fonts.git $HOME/.local/share/fonts/nerd-fonts
	cd $HOME/.local/share/fonts/nerd-fonts
	./build 'Meslo/S/*'

	echo 'updating font cache.....'
	fc-cache -fv

	echo "Installing PowerLevel10k....."
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jstephens/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Start ssh agent
SSHAGENT=`pgrep ssh-agent`
if [ $? -eq 1  ]; then
	eval "$(ssh-agent)"
fi

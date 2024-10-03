# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/litter/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# if [ -f ~/.config/shell/prefuncs ]
#     source ~/.config/shell/prefuncs
# fi

# if [ -f ~/.config/shell/aliases ]
#     source ~/.config/shell/aliases
# fi

# if [ -f ~/.config/shell/commands ]
#     source ~/.config/shell/commands
# fi

source ~/.config/shell/prefuncs
source ~/.config/shell/aliases
source ~/.config/shell/commands

export EDITOR=nvim

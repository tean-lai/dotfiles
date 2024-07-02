# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=nvim
export VISUAL=nvim

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

eval "$(starship init zsh)"
<<<<<<< HEAD
export PATH="/usr/local/anaconda3/bin:$PATH"
=======

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/tean/.dart-cli-completion/zsh-config.zsh ]] && . /home/tean/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

>>>>>>> 547e40b9ad8e68a5b0462a181abe1e3414862b24

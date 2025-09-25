# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
# setopt autocd extendedglob nomatch

export EDITOR=nvim
export VISUAL=nvim

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

if command -v starship &> /dev/null; then 
  eval "$(starship init zsh)"
fi
# export PATH=".config/emacs/bin:$PATH"



# function yy() {
#   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#   yazi "$@" --cwd-file="$tmp"
#     if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#       builtin cd -- "$cwd"
#     fi
#   rm -f -- "$tmp"
# }

# export DVTM_TERM="alacritty dvtm"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# opam configuration
test -r '/Users/tean/.opam/opam-init/init.sh' && . '/Users/tean/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true

# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.3.5

export OCAMLRUNPARAM=b

# export PATH="$HOME/.deno/bin:$PATH"



# Added by LM Studio CLI (lms)
# export PATH="$PATH:/Users/tean/.lmstudio/bin"

. "$HOME/.local/bin/env"

export PATH="$PATH:/opt/homebrew/opt/llvm/bin"

alias p=python3
alias pp=pypy3
alias v=nvim
alias c=cat


alias rv='docker run -i --rm -v "$PWD":/root ghcr.io/shouxulin/cs4414hw1'

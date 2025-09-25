#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias vim='nvim'

export PATH="/opt/homebrew/bin:$PATH"

# function yy() {
#   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#   yazi "$@" --cwd-file="$tmp"
#     if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#       builtin cd -- "$cwd"
#     fi
#   rm -f -- "$tmp"
# }

# export EDITOR=nvim
# export VISUAL=nvim

# opam configuration
test -r '/Users/tean/.opam/opam-init/init.sh' && . '/Users/tean/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tean/.lmstudio/bin"

. "$HOME/.local/bin/env"

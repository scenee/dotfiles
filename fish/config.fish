# Aliases

alias mux="tmuxinator"
alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

# Binds

bind \cd delete-char # Stop an unexpected exit

# Paths

set -x PATH /usr/local/opt/python@3.9/libexec/bin $PATH
set -x PATH /usr/local/opt/opencv@3/bin $PATH
set -x PATH $HOME/.slack/bin $PATH
set -x PATH $HOME/.deno/bin $PATH

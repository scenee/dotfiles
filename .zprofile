bindkey -e
autoload -U compinit
compinit
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
eval "$(/opt/homebrew/bin/brew shellenv)" 

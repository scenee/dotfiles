# Alias

## lazygit

alias lg="lazygit"

## util

alias getplain="pbpaste | pbcopy"

## editors

alias xcode="open -a Xcode.app"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias studio="open -a /Applications/Android\ Studio.app"

## tmuxp

alias mx='tmuxp'
alias fmx='tmuxp ls | fzf --layout=reverse --info=inline --height=40% --print0 | xargs -0 -o tmuxp load'
alias kmx='tmux list-sessions | cut -d" " -f1 | cut -d":" -f1 | fzf --layout reverse --info=inline --height=40% | xargs tmux kill-session -t'

## corepack

alias pn='corepack pnpm'
alias yarn='corepack yarn'


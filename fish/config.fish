# Aliases

alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

# Binds

bind \cd delete-char # Stop an unexpected exit

# Variables

if status --is-login
    set -U fish_color_cwd normal
    set -U fish_color_user normal
    set -U fish_color_comment 6272A4
end

# tmuxp

alias mx='tmuxp'
alias fmx='tmuxp ls | fzf --layout=reverse --info=inline --height=40% --print0 | xargs -0 -o tmuxp load'
alias kmx='tmux list-sessions | cut -d" " -f1 | cut -d":" -f1 | fzf --layout reverse --info=inline --height=40% | xargs tmux kill-session -t'

# pnpm

alias pn='pnpm'

# dart

fish_add_path "$HOME/.pub-cache/bin"


# asdf: This is a workaround for PATH in tmux

fish_add_path "$HOME/.local/asdf/shims"

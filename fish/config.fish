# Aliases

alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

# Binds

bind \cd delete-char # Stop an unexpected exit

# Paths

if test -n $TMUX
    set -x PATH /opt/local/bin /opt/local/sbin $PATH
end

# Variables

if status --is-login
    set -U fish_color_cwd normal
    set -U fish_color_user normal
    set -U fish_color_comment 6272A4
end

# asdf

if test -d ~/.local/asdf
    set -x ASDF_CONFIG_FILE ~/.config/asdf
    set -x ASDF_DIR ~/.local/asdf
    set -x ASDF_DATA_DIR ~/.local/asdf
    source ~/.local/asdf/asdf.fish
end

# tmuxp

alias mux='tmuxp'
alias fmux='tmuxp ls | fzf --layout=reverse --info=inline --height=40% --print0 | xargs -0 -o tmuxp load'
alias kmux='tmux list-sessions | cut -d" " -f1 | cut -d":" -f1 | fzf --layout reverse --info=inline --height=40% | xargs tmux kill-session -t'

# pnpm

alias pn=pnpm

set -gx PNPM_HOME "/Users/shin/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# dart

set -gx PATH "$HOME/.pub-cache/bin" $PATH


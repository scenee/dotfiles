# Aliases

alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

# Binds

bind \cd delete-char # Stop an unexpected exit

# Paths

if test -n $TMUX
    set -x PATH /opt/local/bin /opt/local/sbin $PATH
end

# asdf

if test -d ~/.local/asdf
    set -x ASDF_CONFIG_FILE ~/.config/asdf
    set -x ASDF_DIR ~/.local/asdf
    set -x ASDF_DATA_DIR ~/.local/asdf
    source ~/.local/asdf/asdf.fish
end

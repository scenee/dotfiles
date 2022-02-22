# Aliases

alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

# Binds

bind \cd delete-char # Stop an unexpected exit

# Paths

if test -n $TMUX
set -x PATH /opt/local/bin /opt/local/sbin $PATH
end

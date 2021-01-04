zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/functions $fpath)

# added by travis gem
[ -f /Users/shin/.travis/travis.sh ] && source /Users/shin/.travis/travis.sh

## Added by $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

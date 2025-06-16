zstyle ':completion:*:*:git:*' script $HOME/.git-completion.bash

fpath=($HOME/.zsh $fpath)

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

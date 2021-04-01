zstyle ':completion:*:*:git:*' script $HOME/.git-completion.bash

fpath=($HOME/.zsh $fpath)

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

## Added by $(brew --prefix)/opt/fzf/install
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


### Added by gcloud installer
#
## The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/path.zsh.inc"; fi

## The next line enables shell command completion for gcloud.
if [ -f "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.gcloud/google-cloud-sdk/completion.zsh.inc"; fi

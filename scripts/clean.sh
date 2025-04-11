#!/usr/bin/env bash

cleanup() {
    local target=$@
    if [[ -L $target ]] && rm $target; then
        echo "Cleaning $target"
    fi
}

echo "Removing symbolic links to dotfiles..."

pushd "$HOME" >/dev/null
cleanup .bashrc
cleanup .zshrc
cleanup .zprofile
cleanup .profile
cleanup .vimrc
cleanup .tigrc
cleanup .git-completion.bash
cleanup .tmux.conf
cleanup .tmux.mac.conf
cleanup .tmux.linux.conf
cleanup .ripgreprc
cleanup .config/asdf
cleanup .config/fish
cleanup .config/git
popd >/dev/null

echo "Removing $HOME/.zsh..."
pushd "$HOME" >/dev/null
[[ -d .zsh ]] && rm -rf .zsh
popd >/dev/null

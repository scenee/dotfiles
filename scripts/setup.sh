#!/usr/bin/env bash

DOTFILES=${PWD}

pushd ~/ >/dev/null

mkdir -p .local/go
mkdir -p .local/cargo

backup() {
    local target=$1
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up $target to ${target}.bak"
        mv "$target" "${target}.bak"
    fi
}

setup() {
    local target="$1"
    backup "$target"
    ln -snf "${DOTFILES}/$target" "$target"
    echo "Setting up $target"
}

setup .vimrc
setup .tigrc
setup .ripgreprc
setup .git-completion.bash
setup .tmux.conf

if [ "$(uname)" = 'Linux' ]; then
    :
elif [ "$(uname)" = 'Darwin' ]; then
    setup .shinit
    setup .bashrc
    setup .zshrc
    setup .zprofile
    setup .profile
fi

mkdir -p .config
setup .config/asdf
setup .config/cargo
setup .config/fish
setup .config/git
setup .config/tmux


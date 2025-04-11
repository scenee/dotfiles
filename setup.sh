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
    local target=$1
    backup $1
    ln -snf ${DOTFILES}/$1
}

setup .vimrc
setup .tigrc
setup .plantuml
setup .ripgreprc
setup .git-completion.bash
setup .tmux.conf

if [ "$(uname)" = 'Linux' ]; then
    ln -snf ${DOTFILES}/.tmux.linux.conf .tmux.linux.conf
elif [ "$(uname)" = 'Darwin' ]; then
    setup .shinit
    setup .bashrc
    setup .zshrc
    setup .zprofile
    setup .profile

    ln -snf ${DOTFILES}/.tmux.mac.conf .tmux.mac.conf
fi

if [ -d .config ]; then
    backup .config/fish
    backup .config/asdf
    backup .config/git
    ln -snf ${DOTFILES}/fish .config/fish
    ln -snf ${DOTFILES}/asdf .config/asdf
    ln -snf ${DOTFILES}/git .config/git
fi


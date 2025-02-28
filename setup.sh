#!/usr/bin/env bash

DOTFILES=${PWD}

pushd ~/ >/dev/null

mkdir -p .local/go
mkdir -p .local/cargo

# バックアップ用の関数を定義
backup() {
    local target=$1
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up $target to ${target}.bak"
        mv "$target" "${target}.bak"
    fi
}

backup .shinit
backup .bashrc
backup .zshrc
backup .zprofile
backup .profile
backup .vimrc
backup .tigrc
backup .plantuml
backup .ripgreprc
backup .gitconfig
backup .git-completion.bash
backup .tmux.conf

ln -snf ${DOTFILES}/.shinit
ln -snf ${DOTFILES}/.bashrc
ln -snf ${DOTFILES}/.zshrc
ln -snf ${DOTFILES}/.zprofile
ln -snf ${DOTFILES}/.profile
ln -snf ${DOTFILES}/.vimrc
ln -snf ${DOTFILES}/.tigrc
ln -snf ${DOTFILES}/.plantuml
ln -snf ${DOTFILES}/.ripgreprc
ln -snf ${DOTFILES}/.gitconfig
ln -snf ${DOTFILES}/.git-completion.bash
ln -snf ${DOTFILES}/.tmux.conf .tmux.conf

if [ "$(uname)" = 'Linux' ]; then
    ln -snf ${DOTFILES}/.tmux.linux.conf .tmux.linux.conf
elif [ "$(uname)" = 'Darwin' ]; then
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


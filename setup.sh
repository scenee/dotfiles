#!/usr/bin/env bash

DOTFILES=${PWD}

pushd ~/ >/dev/null

mkdir -p .local/go
mkdir -p .local/cargo

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
ln -snf ${DOTFILES}/fish .config/fish
ln -snf ${DOTFILES}/asdf .config/asdf
ln -snf ${DOTFILES}/git .config/git
fi


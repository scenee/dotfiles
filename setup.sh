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
ln -snf ${DOTFILES}/.tmux.conf
ln -snf ${DOTFILES}/.plantuml
ln -snf ${DOTFILES}/.ripgreprc
ln -snf ${DOTFILES}/.gitconfig
ln -snf ${DOTFILES}/.git-completion.bash

if [ "$(uname)" = 'Darwin' ]; then
	ln -snf ${DOTFILES}/macos/git/config .gitconfig.macos
fi

if [ -d .config ]; then
ln -snf ${DOTFILES}/fish .config/fish
ln -snf ${DOTFILES}/asdf .config/asdf
ln -snf ${DOTFILES}/git .config/git
fi


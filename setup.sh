#!/bin/bash

DOTFILES=${PWD}

pushd ~/ >/dev/null

mkdir -p .local/go
mkdir -p .local/cargo

ln -shf ${DOTFILES}/.shinit
ln -shf ${DOTFILES}/.bashrc
ln -shf ${DOTFILES}/.zshrc
ln -shf ${DOTFILES}/.zprofile
ln -shf ${DOTFILES}/.profile
ln -shf ${DOTFILES}/.vimrc
ln -shf ${DOTFILES}/.gitconfig
ln -shf ${DOTFILES}/.gitignore_global
ln -shf ${DOTFILES}/git-completion.bash .git-completion.bash
ln -shf ${DOTFILES}/.tigrc
ln -shf ${DOTFILES}/.tmux.conf
ln -shf ${DOTFILES}/.plantuml
ln -shf ${DOTFILES}/.ripgreprc
ln -shf ${DOTFILES}/fish .config/fish


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
ln -snf ${DOTFILES}/.gitconfig
ln -snf ${DOTFILES}/.gitignore_global
ln -snf ${DOTFILES}/git-completion.bash .git-completion.bash
ln -snf ${DOTFILES}/.tigrc
ln -snf ${DOTFILES}/.tmux.conf
ln -snf ${DOTFILES}/.plantuml
ln -snf ${DOTFILES}/.ripgreprc
ln -snf ${DOTFILES}/fish .config/fish


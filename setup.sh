#!/bin/bash

DOTFILES=${PWD}

pushd ~/ >/dev/null
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

[[ -d .zsh ]] || mkdir .zsh
>/dev/null command -v swift && swift package completion-tool generate-zsh-script > .zsh/_swift
popd >/dev/null

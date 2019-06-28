#!/bin/bash

DOTFILES=${PWD}

pushd ~/ >/dev/null
ln -s ${DOTFILES}/.bashrc
ln -s ${DOTFILES}/.zprofile
ln -s ${DOTFILES}/.profile
ln -s ${DOTFILES}/.vimrc
ln -s ${DOTFILES}/.git-completion.bash
ln -s ${DOTFILES}/.tigrc
ln -s ${DOTFILES}/.gitconfig
ln -s ${DOTFILES}/.tmux.conf
ln -s ${DOTFILES}/.plantuml
ln -s ${DOTFILES}/.ripgreprc
popd >/dev/null

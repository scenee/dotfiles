#!/bin/bash

DOTFILES=${PWD}

pushd ~/ >/dev/null
ln -s ${DOTFILES}/.bash_profile
ln -s ${DOTFILES}/.vimrc
ln -s ${DOTFILES}/.git-completion.bash
ln -s ${DOTFILES}/.tigrc
ln -s ${DOTFILES}/.gitconfig
ln -s ${DOTFILES}/.plantuml
popd >/dev/null

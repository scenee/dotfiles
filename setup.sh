#!/bin/bash

DOTFILES=${PWD}

pushd ~/ >/dev/null
[[ ! -f .bash_profile ]] || rm .bash_profile
[[ ! -f .vimrc ]] || rm .vimrc
[[ ! -f .git-completion.bash ]] || rm .git-completion.bash
[[ ! -f .tigrc ]] || rm .tigrc
[[ ! -f .gitconfig ]] || rm .gitconfig
[[ ! -d .plantuml ]] || rm -rf .plantuml
ln -s ${DOTFILES}/.bash_profile
ln -s ${DOTFILES}/.vimrc
ln -s ${DOTFILES}/.git-completion.bash
ln -s ${DOTFILES}/.tigrc
ln -s ${DOTFILES}/.gitconfig
ln -s ${DOTFILES}/.plantuml
popd >/dev/null

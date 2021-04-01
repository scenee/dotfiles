#!/bin/bash

echo "Removing symbolic links to dotfiles..."

pushd ~/ >/dev/null
[[ -L .bashrc ]] && rm -f .bashrc
[[ -L .zshrc ]] && rm -f .zshrc
[[ -L .zprofile ]] && rm -f .zprofile
[[ -L .profile ]] && rm -f .profile
[[ -L .vimrc ]] && rm -f .vimrc
[[ -L .tigrc ]] && rm -f .tigrc
[[ -L .gitconfig ]] && rm -f .gitconfig
[[ -L .gitignore_global ]] && rm -f .gitignore_global
[[ -L .git-completion.bash ]] && rm -f .git-completion.bash
[[ -L .tmux.conf ]] && rm -f .tmux.conf
[[ -L .plantuml ]] && rm -rf .plantuml
[[ -L .ripgreprc ]] && rm -rf .ripgreprc
popd >/dev/null

echo "Removing $HOME/.zsh..."

pushd ~/ >/dev/null
[[ -d .zsh ]] && rm -f .zsh
popd >/dev/null

echo "Cleaning gems..."

gem uninstall -I -a -x --user-install

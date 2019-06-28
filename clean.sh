#!/bin/bash

echo "Removing symbolic links to dotfiles..."

pushd ~/ >/dev/null
[[ -L .profile ]] && rm -f .profile
[[ -L .bashrc ]] && rm -f .bashrc
[[ -L .vimrc ]] && rm -f .vimrc
[[ -L .git-completion.bash ]] && rm -f .git-completion.bash
[[ -L .tigrc ]] && rm -f .tigrc
[[ -L .gitconfig ]] && rm -f .gitconfig
[[ -L .tmux.conf ]] && rm -f .tmux.conf
[[ -L .plantuml ]] && rm -rf .plantuml
[[ -L .ripgreprc ]] && rm -rf .ripgreprc
popd >/dev/null

echo "Cleaning gems..."

gem uninstall -I -a -x --user-install

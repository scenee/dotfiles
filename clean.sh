#!/bin/bash

pushd ~/ >/dev/null
[[ -L .bash_profile ]] && rm -f .bash_profile
[[ -L .vimrc ]] && rm -f .vimrc
[[ -L .git-completion.bash ]] && rm -f .git-completion.bash
[[ -L .tigrc ]] && rm -f .tigrc
[[ -L .gitconfig ]] && rm -f .gitconfig
[[ -L .plantuml ]] && rm -rf .plantuml
popd >/dev/null

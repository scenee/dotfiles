#!/bin/bash

ln -s ${PWD}/.bash_profile ~/.bash_profile
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.git-completion.bash ~/.git-completion.bash
ln -s ${PWD}/.tigrc ~/.tigrc
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.plantuml ~/.plantuml

# Install vundle
if ! test -d ~/.vim/bundle;
then
	echo "Install Vundle for vim..."
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

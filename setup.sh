#!/bin/bash

ln -s ${PWD}/.bash_profile ~/.bash_profile
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.git-completion.bash ~/.git-completion.bash
ln -s ${PWD}/.tigrc ~/.tigrc
ln -s ${PWD}/.gitconfig ~/.gitconfig

# Install vundle
if ! test -d ~/.vim/bundle;
then
	mkdir ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

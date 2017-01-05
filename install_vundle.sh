#!/bin/bash

if test -d ~/.vim/bundle;
then
	echo "Already installed: ~/.vim/vundle"
else
	echo "Install Vundle for vim..."
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

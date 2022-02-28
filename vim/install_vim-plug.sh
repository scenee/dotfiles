#!/usr/bin/env bash

if test -f ~/.vim/autoload/plug.vim
then
	echo "Already installed: ~/.vim/autoload/plug.vim"
else
	echo "Install vim-plug for vim..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -s ${PWD}/.vimrc ~/.vimrc

if test -f ~/.gitconfig;
then
	ln -s ${PWD}/.gitconfig ~/.gitconfig
else
	echo "Warning: Found a existing .gitconfig: $HOME/.gitconfig"
	echo "	Please set up .gitconfig manually"
fi

ln -s ${PWD}/.git-completion.bash ~/.git-completion.bash
ln -s ${PWD}/.tigrc ~/.tigrc

mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

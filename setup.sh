ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.git-completion.bash ~/.git-completion.bash
ln -s ${PWD}/.tigrc ~/.tigrc

mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

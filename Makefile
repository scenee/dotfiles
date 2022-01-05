
.PHONY: all
all: setup install_plug

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup: clean setup-vim
	./setup.sh

.PHONY: setup-vim
setup-vim:
	./vim/install_vim-plug.sh
	./vim/install_plugins.sh

.PHONY: clean
clean:
	./clean.sh


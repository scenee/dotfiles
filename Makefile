
.PHONY: all
all: setup install_plug

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup: clean
	./scripts/setup.sh

.PHONY: tmux
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

.PHONY: vim
vim:
	./scripts/vim/install_vim-plug.sh
	./scripts/vim/install_plugins.sh

.PHONY: clean
clean:
	./scripts/clean.sh



.PHONY: all
all: setup install_plug

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup: clean
	./setup.sh

.PHONY: install_vundle
install_vundle:
	@./install_vundle.sh

.PHONY: install_plug
install_plug:
	@./install_vim-plug.sh

.PHONY: clean
clean:
	./clean.sh


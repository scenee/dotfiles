
.PHONY: all
all: setup install_vundle

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup:
	./setup.sh


.PHONY: install_vundle
install_vundle:
	./install_vundle.sh



.PHONY: all
all: setup install_plug

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup: clean
	./setup.sh

.PHONY: install_plug
install_plug:
	./install_vim-plug.sh

.PHONEY: gems
gems:
	sudo gem install bundler
	sudo bundle install

.PHONY: clean
clean:
	./clean.sh


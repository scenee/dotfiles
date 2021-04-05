
.PHONY: all
all: setup install_plug

.PHONEY: test
test:
	echo ${PWD}

.PHONY: setup
setup: clean gems
	./setup.sh

.PHONY: install_plug
install_plug:
	./install_vim-plug.sh

.PHONEY: gems
gems:
	gem install bundler
	bundle install --system

.PHONY: clean
clean:
	./clean.sh


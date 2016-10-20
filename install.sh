#!/bin/bash -eu

BLUE='\033[0;34m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'
ARROW="${BLUE}==>${NC}${BOLD}"

print() {
	echo -e "$1${NC}"
}

install() {
	if test $dist = Raspbian -or $dist = Ubuntu; then
		sudo apt-get -qy update
		sudo apt-get -qy install $1
	else
		: # TODO
	fi
}

os_name=$(uname)
if test $os_name = Darwin; then

	print "$ARROW Check xcode-select"

	xcode-select -p > /dev/null

	if test 0 -ne $?; then
		print "==> Run: xcode-select --install"
		xcode-select --install
	fi

elif test $os_name = Linux; then

	dist="$(lsb_release -i | awk '{ print $3 }')"

	print "$ARROW Detect distribution: $dist"
	print "$ARROW Check git"
	if ! which git > /dev/null; then
		print "==> Install git"
		install git
	fi
fi

print "$ARROW Fetch dotfiles"

git clone https://github.com/SCENEE/dotfiles.git

pushd dotfiles > /dev/null

print "$ARROW Set up dotfiles"

./setup.sh
popd > /dev/null

print "${BOLD}Done!${NC}"

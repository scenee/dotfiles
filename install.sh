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
if test $os_name = Darwin;
then

	print "$ARROW Checking xcode-select"

	xcode-select -p > /dev/null

	if test 0 -ne $?; then
		print "==> Run: xcode-select --install"
		xcode-select --install
	fi
	print "$ARROW Checking Xcode license"
	sudo xcodebuild -license

elif test $os_name = Linux;
then

	dist="$(lsb_release -i | awk '{ print $3 }')"

	print "$ARROW Detected distribution: $dist"
	print "$ARROW Checking git"
	if ! which git > /dev/null; then
		print "==> Install git"
		install git
	fi
fi

print "$ARROW Fetching dotfiles"

git clone https://github.com/SCENEE/dotfiles.git ~/.dotfiles

pushd ~/.dotfiles > /dev/null

print "${BOLD}Installed dotfiles!${NC}"

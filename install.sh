#!/bin/bash -eu

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

	echo "==> Check xcode-select"

	xcode-select -p > /dev/null

	if test 0 -ne $?; then
		echo "==> Run: xcode-select --install"
		xcode-select --install
	fi

elif test $os_name = Linux; then

	dist="$(lsb_release -i | awk '{ print $3 }')"

	echo "==> Detect distribution: $dist"
	echo "==> Check git"
	if ! which git > /dev/null; then
		echo "==> Install git"
		install git
	fi
fi

echo "==> Fetch dotfiles..."
echo ""
git clone https://github.com/SCENEE/dotfiles.git

pushd dotfiles > /dev/null
echo "==> Set up dotfiles..."
echo ""
./setup.sh
popd > /dev/null

echo ""
echo "Done!"

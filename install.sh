#!/bin/bash -eu

if test uname = Darwin; then

	echo "==> Check xcode-select"

	xcode-select -p > /dev/null

	if test 0 -ne $?; then
		echo "==> Run: xcode-select --install"
		xcode-select --install
	fi

elif test uname = Linux; then

	dist="$(lsb_release -i | awk '{ print $3 }')"

	if test $dist = Raspbian -or $dist = Ubuntu; then

		echo "==> Check git"
		if ! which git > /dev/null; then
			echo "==> Install git"
			sudo apt-get install git -y 
		fi
	else
		: # TODO
	fi

fi

echo "OK"

echo "=> Fetch dotfiles"
git clone https://github.com/SCENEE/dotfiles.git > /dev/null

pushd dotfiles
echo "=> Set up"
./setup.sh
popd

echo "Done!"

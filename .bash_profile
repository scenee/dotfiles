# Env
export EDITOR=vim

## LANG
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_ALL=en_US.UTF-8
export IGNOREEOF=3

# custmizing commands
alias c="cd "
alias cp="cp -i"
alias ll="ls -AlFh"
alias ls="ls -F"
alias o="open "
alias po="popd "
alias pu="pushd "
alias py="python "
alias rm="rm -id"
alias v="vim"
alias vi="vim"
alias x="xargs"
alias getplain='pbpaste | pbcopy'

if [ ! -z $BASH_VERSION ]; then
	export PS1="[\u@\h \W]\$ "
elif [ ! -z $ZSH_VERSION ]; then
	export PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
fi
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Less
export LESS='-g -i -R -z-4 -x4'
export PAGER=less
if which lesspipe.sh > /dev/null; then
	export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Subversion
export SVN_EDITOR=vim

# Git
if [ ! -z $BASH_VERSION ] ; then
  source ~/.git-completion.bash
fi

## Common ###

### rbenv ###
if which rbenv > /dev/null;
then
	export PATH=~/.rbenv/shims:$PATH
	eval "$(rbenv init -)";
	PATH="~/.rbenv/shims:$PATH"
fi

### gvm ###
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh" ]] && source "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh"

### pyenv ###
if which pyenv > /dev/null;
then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	export VIRTUALENVWRAPPER_PYTHON="$PYENV_ROOT/shims/python"
	eval "$(pyenv init -)"
	eval "$(pip completion --bash)"
fi

### swiftenv ###
which swiftenv > /dev/null && eval "$(swiftenv init -)"

### PostgreSQL ###
which psql >/dev/null && export PGDATA=/usr/local/var/postgres

### nodebrew ###
which nodebrew >/dev/null && export PATH=$HOME/.nodebrew/current/bin:$PATH

# Mac
if [ "$(uname)" = 'Darwin' ];
then
	if [ -r ~/.bash_private ]; then
		source ~/.bash_private
	else
		echo "Not found .bash_private"
	fi

	function empty-trash () {
		if [ -z "$(ls -A ~/.Trash/)" ]; then
			echo "Trash is empty"
		else
			osascript -e 'tell app "Finder" to empty'
		fi
	}
	

	### Homebrew ###
	if which brew > /dev/null;
	then
		if [ -f $(brew --prefix)/etc/bash_completion ]; then
			. $(brew --prefix)/etc/bash_completion
		fi
		# WARN:  Please set HOMEBREW_GITHUB_API_TOKEN in ~/.bashrc
		alias ctags="`brew --prefix`/bin/ctags"
	fi

	### Dropbox ###
	if test -d /Applications/Dropbox.app;
	then
		DROPBOX_PATH=~/Dropbox
		function mount_keyvault() {
			$DROPBOX_PATH/EncryptedData/mnt_keyvault
		}

		function umount_keyvault() {
			$DROPBOX_PATH/EncryptedData/umnt_keyvault
		}
	fi

	### relax ###
	which relax > /dev/null && source "$(relax init completion)"

	### Anaconda ###
	if test -d  ~/anaconda*;
	then
		function activate_anaconda() {
			# added by Anaconda3 4.0.0 installer
			PATH0="$PATH"
			export PATH="/Users/syamamoto/anaconda3/bin:$PATH"
		} 

		function deactivate_anaconda() {
			if test ${PATH0:-undefined} != undefined; then
				export PATH="$PATH0"
			fi
		}
	fi

	### Octave ###
	if which octave > /dev/null;
	then
		## To define a plot application
		export GNUTERM=x11
	fi

	### iTerm ###
	chtname()  { 
		echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
	}

	### Fix OpenSSL version for macOS ###
	if [ -d /usr/local/opt/openssl ]; then
		export PATH=/usr/local/opt/openssl/bin:$PATH
		export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$LD_LIBRARY_PATH
		export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH
	fi

	### Travis CI ###
	[ -f /Users/syamamoto/.travis/travis.sh ] && source /Users/syamamoto/.travis/travis.sh
fi

[ -r ~/.bashrc ] && source ~/.bashrc

export PATH="/usr/local/sbin:$PATH"

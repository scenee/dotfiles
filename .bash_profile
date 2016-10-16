# LANG
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_ALL=en_US.UTF-8
export IGNOREEOF=3

# custmizing commands
alias c="cd "
alias cp="cp -i"
alias grep="grep -E"
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

if [ ! -z $BASH_VERSION ]; then
	export PS1="\w$ "
elif [ ! -z $ZSH_VERSION ]; then
	export PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
fi
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Subversion
export SVN_EDITOR=vim

# Git
if [ ! -z $BASH_VERSION ] ; then
  source ~/.git-completion.bash
fi

# Mac
if [ "$(uname)" = 'Darwin' ];
then
	### brew ###
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
	HOMEBREW_GITHUB_API_TOKEN=354059136c23a22c9755813533648ae396a58118
	alias ctags="`brew --prefix`/bin/ctags"

	### Shortcut ###
	KEYVAULT_PATH="/Volumes/KeyVault"
	DROPBOX_PATH=~/Dropbox
	DOCUMENT_PATH="$DROPBOX_PATH/Documents"
	SETTING_PATH="$DROPBOX_PATH/Settings"

	function mount_keyvault() {
		$DROPBOX_PATH/EncryptedData/mnt_keyvault
	}

	function umount_keyvault() {
		$DROPBOX_PATH/EncryptedData/umnt_keyvault
	}

	### Octave ###
	## To define a plot application
	export GNUTERM=x11

	### rbenv ###
	export PATH=~/.rbenv/shims:$PATH
	if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
	PATH="~/.rbenv/shims:~/.rbenv/versions/2.2.2/bin:$PATH"

	#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
	[[ -s "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh" ]] && source "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh"

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

	##### pyenv ###
  if which pyenv 2>&1 >&-;
  then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  fi
fi

[ -r ~/.bashrc ] && source ~/.bashrc

export PATH="/usr/local/sbin:$PATH"
export EDITOR=vim

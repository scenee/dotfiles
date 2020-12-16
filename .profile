# ===================== Env ========================
export EDITOR=vim
export TERM="xterm-256color"

export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8
export LC_ALL=en_US.UTF-8
export IGNOREEOF=3

if [ ! -z $BASH_VERSION ]; then
	export PS1="[\u@\h \W]\$ "
elif [ ! -z $ZSH_VERSION ]; then
	export PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
fi
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

## undefine Ctrl-S for i-search
stty stop undef

# ===================== Alias ======================
alias ..='cd ..'
alias cp="cp -i"
alias rm="rm -id"
alias x="xargs"
alias be='bundle exec'
alias python=python3
alias pip=pip3
alias mux="tmuxinator"

if [ "$(uname)" = 'Darwin' ];
then
alias ls='ls -GpF' # Mac OSX specific
alias ll='ls -alGpF' # Mac OSX specific
alias o="open "
alias getplain='pbpaste | pbcopy'
else
alias ll="ls -AlFh"
alias ls="ls -F"
fi

alias vi="vim" # Use vim installed by brew

# ===================== less ======================
export LESS='-g -i -R -z-4 -x4'
export PAGER=less
if which lesspipe.sh > /dev/null; then
	export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# ===================== svn =======================
export SVN_EDITOR=vim

# ===================== git ======================-
case $SHELL in
*bash)
	[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
	;;
esac
gr() { cd "`git rev-parse --show-toplevel`"; }

# ===================== rbenv ======================
>/dev/null which rbenv \
	&& export PATH=~/.rbenv/shims:$PATH \
	&& eval "$(rbenv init -)" \
	&& PATH="~/.rbenv/shims:$PATH"

# ===================== gvm ========================
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh" ]] \
	&& source "/Users/shin.yamamoto/.gvm/bin/gvm-init.sh"

# ===================== pipenv ======================
> /dev/null which pipenv \
	eval "$(pipenv --completion)"

# ===================== postgres ====================
>/dev/null which psql \
	&& export PGDATA=/usr/local/var/postgres

# ===================== nodebrew ====================
>/dev/null which nodebrew \
	&& export PATH=$HOME/.nodebrew/current/bin:$PATH

# ===================== go ==========================
>/dev/null which go \
	&& export GOPATH=$HOME/.go \
	&& export PATH=$PATH:$GOPATH/bin
# ===================== haskell =====================
>/dev/null which stack \
	&& export PATH="$HOME/.local/bin:$PATH"

# ===================== rust =====================
[ -d ~/.cargo ] \
	&& export PATH="$HOME/.cargo/bin:$PATH"

# ===================== fzf =========================
case $SHELL in
*bash)
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
	;;
*zsh)
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	;;
esac

# ===================== ghq =========================
if [ -f ~/.fzf.bash ] && >/dev/null which ghq; then
	function _gl() {
		local path=$(ghq list | fzf)
		[[ -n $path ]] &&
			pushd "$(ghq root)/$path"
	}
	function _gget() {
		local url="$1"
		ghq get "$url"
	}
	alias gl=_gl
	alias gget=_gget
fi

# ===================== rg ==========================
>/dev/null which rg \
	&& export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# ==================== tmux =========================
function _tmux_new_init() {
	tmux new-session -c ~/Workspace -s 'init' -n 'workspace' \; \
		new-window -a -c ~/Workspace/scenee/sandbox -n 'sandbox' \; \
		new-window -a -c ~/Workspace/scenee/notebooks -n 'note' \; \
		select-window -t:-2 \; \
		attach
}

function tmux-init() {
	tmux attach -t init || _tmux_new_init
}

# ===================== macOS =======================
if [ "$(uname)" = 'Darwin' ];
then
	[ -r ~/.private ] && source ~/.private || echo "Not found .private"

	# ------------------ brew -------------------
	if which brew > /dev/null;
	then
		if [[ $SHELL =~ bash && -f $(brew --prefix)/etc/bash_completion ]]; then
			. $(brew --prefix)/etc/bash_completion
		fi
		# WARN:  Please set HOMEBREW_GITHUB_API_TOKEN in ~/.bashrc
		if [[  -f `brew --prefix`/bin/ctags ]]; then
			alias ctags="`brew --prefix`/bin/ctags"
		fi
	fi

	# ------------------ dropbox -----------------
	if test -d /Applications/Dropbox.app;
	then
		DROPBOX_PATH=~/Dropbox
		function kvopen() {
			$DROPBOX_PATH/EncryptedData/mnt_keyvault
		}

		function kvclose() {
			$DROPBOX_PATH/EncryptedData/umnt_keyvault
		}
	fi

	# ------------------ relax --------------------
	which relax > /dev/null && [ $SHELL =~ bash ] && source "$(relax init completion)"

	# ------------------ anaconda -----------------
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

	# ------------------ octave -------------------
	if which octave > /dev/null;
	then
		## To define a plot application
		export GNUTERM=x11
	fi

	# ------------------ iterm ---------------------
	tt ()  { 
		echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
	}

	# ------------------ gettext --------------------
	export PATH="/usr/local/opt/gettext/bin:$PATH"

	# ------------------ travis ci ------------------
	[ -f /Users/syamamoto/.travis/travis.sh ] && source /Users/syamamoto/.travis/travis.sh

	# ------------------ visual code ------------------
	export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

	# ------------------ android studio -------------
	alias studio="open -a /Applications/Android\ Studio.app"
fi

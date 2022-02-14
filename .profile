export EDITOR=vim
export TERM="xterm-256color"

export LANG=en_US.UTF-8
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
if command -v lesspipe.sh > /dev/null; then
	export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# ===================== git ======================-

case $SHELL in
*bash)
	[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
	;;
esac
gr() { cd "`git rev-parse --show-toplevel`"; }

# ===================== fzf =========================

[[ $SHELL =~ bash ]] \
	&& [ -f "$HOME/.config/fzf/config.bash" ] \
	&& source "$HOME/.config/fzf/config.bash"

# ===================== rg ==========================

>/dev/null command -v rg \
	&& export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# ===================== deno ==========================

>/dev/null command -v deno \
       && export PATH="$HOME/.deno/bin:$PATH"

# ===================== go ==========================

[ -d "$HOME/.local/share/go" ] \
	&& export GOPATH=$HOME/.local/share/go \
	&& export PATH=$PATH:$GOPATH/bin

# ===================== haskell =====================

>/dev/null command -v stack \
	&& export PATH="$HOME/.local/bin:$PATH"

# ===================== rust =====================

[ -d "$HOME/.local/share/cargo" ] \
	&& export CARGO_HOME="$HOME/.local/share/cargo" \
	&& export PATH="$CARGO_HOME/bin:$PATH"


if [ "$(uname)" = 'Darwin' ];
then
	[ -r ~/.private ] && source ~/.private || echo "Not found .private"

	# ==================== tmux =========================

	function _tmux_new_init() {
		tmux new-session -c ~/Workspace -s 'init' -n 'workspace' \; \
			new-window -a -c ~/Workspace/scenee/sandbox -n 'sandbox' \; \
			new-window -a -c ~/Workspace/scenee/notebooks -n 'note' \; \
			new-window -a -c ~/Workspace/tmp -n 'tmp' \; \
			select-window -t:-2 \; \
			attach
	}

	function tmux-init() {
		tmux attach -t init || _tmux_new_init
	}

	# --------------------- ghq -------------------------
	if [ -f ~/.fzf.bash ] && >/dev/null command -v ghq;
	then
		function _gl() {
			local root="$(ghq root)"
			local subpath="$(ghq list | fzf)"
			[[ -n $path ]] &&
				pushd "$root/$subpath"
		}
		function _gget() {
			local url="$1"
			ghq get "$url"
		}
		alias glist=_gl
		alias gget=_gget
	fi

	# ------------------ macport -------------------

	if test -f /opt/local/bin/port;
	then
		export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
		export MANPATH="/opt/local/share/man:$MANPATH"
	fi

	# ------------------ brew -------------------
	if command -v brew > /dev/null;
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

	command -v relax > /dev/null && [ $SHELL =~ bash ] && source "$(relax init completion)"

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
	if command -v octave > /dev/null;
	then
		## To define a plot application
		export GNUTERM=x11
	fi

	# ------------------ gettext --------------------

	export PATH="/usr/local/opt/gettext/bin:$PATH"

	# ------------------ visual code ------------------

	export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

	# ------------------ android studio -------------

	alias studio="open -a /Applications/Android\ Studio.app"
fi

source "$HOME/.shinit"
export ENV="$HOME/.shinit"

# ===================== asdf ==========================

if [ -d "$HOME/.local/asdf" ]; then
    export ASDF_DIR="$HOME/.local/asdf"
    export ASDF_DATA_DIR="${ASDF_DIR}"
    export ASDF_CONFIG_FILE=~/.config/asdf/asdfrc
    source "${ASDF_DIR}/asdf.sh"
fi

# ===================== ip ==========================

>/dev/null command -v ip \
	&& alias ip="ip --color"

# ===================== rg ==========================

>/dev/null command -v rg \
	&& export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# ===================== deno ========================

>/dev/null command -v deno \
       && export PATH="$HOME/.deno/bin:$PATH"

# ===================== go ==========================

[ -d "$HOME/.local/go" ] \
	&& export GOPATH=$HOME/.local/go \
	&& export PATH=$PATH:$GOPATH/bin

# ===================== haskell =====================

>/dev/null command -v stack \
	&& export PATH="$HOME/.local/bin:$PATH"

# ===================== rust ========================

[ -d "$HOME/.local/cargo" ] \
	&& export CARGO_HOME="$HOME/.local/cargo" \
	&& export PATH="$CARGO_HOME/bin:$PATH"

# ===================== swift =======================

[ -d "$HOME/.local/swift" ] \
	&& export SWIFT_HOME="$HOME/.local/swift" \
	&& export PATH="$SWIFT_HOME/bin:$PATH"

# ===================== zsh ======================

if [ ! -z $ZSH_VERSION ]; then
	export PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
fi

[ -d "$HOME/.rye" ] \
	&& source "$HOME/.rye/env"

if [ "$(uname)" = 'Darwin' ];
then
	[ -r ~/.private ] && source ~/.private || echo "Not found .private"

	export PATH="$HOME/.local/bin:$PATH"

	# ------------------ macport -------------------

	if test -f /opt/local/bin/port;
	then
		export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
		export MANPATH="/opt/local/share/man:$MANPATH"
	fi

	# ------------------ brew -------------------
	if command -v brew > /dev/null;
	then
		if [[ ! -z "$BASH" && -f $(brew --prefix)/etc/bash_completion ]]; then
			. $(brew --prefix)/etc/bash_completion
		fi
		# WARN:  Please set HOMEBREW_GITHUB_API_TOKEN in ~/.bashrc
		if [[  -f `brew --prefix`/bin/ctags ]]; then
			alias ctags="`brew --prefix`/bin/ctags"
		fi
	fi

	# -------------------- tmux -------------------------

	function _tmux_new_init() {
		tmux new-session -c "${HOME}/Workspace" -s 'init' -n 'workspace' \; \
			new-window -a -c "${HOME}/Workspace/scenee/github/sandbox" -n 'sandbox' \; \
			new-window -a -c "${HOME}/Workspace/scenee/github/notebooks" -n 'note' \; \
			new-window -a -c "${HOME}/Workspace/tmp" -n 'tmp' \; \
			select-window -t:-3 \; \
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

	# ------------------ visual code ------------------

	export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

	# ------------------ android studio -------------

	alias studio="open -a /Applications/Android\ Studio.app"
fi

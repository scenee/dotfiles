source "$HOME/.shinit"
export ENV="$HOME/.shinit"
export PATH="$HOME/.local/bin:$PATH"

# ===================== asdf ==========================

if [ -d "$HOME/.local/share/asdf" ]; then
    export ASDF_DIR="$HOME/.local/share/asdf"
    export ASDF_DATA_DIR="${ASDF_DIR}"
    export ASDF_CONFIG_FILE="$HOME/.config/asdf/asdfrc"
    export ASDF_NPM_DEFAULT_PACKAGES_FILE="$HOME/.config/asdf/default-npm-packages"
fi

# ===================== ip ==========================

>/dev/null command -v ip \
	&& alias ip="ip --color"

# ===================== deno ========================

>/dev/null command -v deno \
       && export PATH="$HOME/.deno/bin:$PATH"

# ===================== go ==========================

[ -d "$HOME/.local/share/go" ] \
	&& export GOPATH=$HOME/.local/share/go \
	&& export PATH=$PATH:$GOPATH/bin

# ===================== haskell =====================

>/dev/null command -v stack \
	&& export PATH="$HOME/.local/bin:$PATH"

# ===================== rg ==========================

>/dev/null command -v rg \
	&& export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# ===================== rust ========================

[ -d "$HOME/.local/share/cargo" ] \
	&& export CARGO_HOME="$HOME/.local/share/cargo" \
	&& test -f "$HOME/.local/share/cargo/env" \
    && source "$HOME/.local/share/cargo/env"

# ===================== swift =======================

export SWIFTLY_HOME_DIR="$HOME/.local/share/swiftly"

# ===================== zsh ======================

if [ ! -z $ZSH_VERSION ]; then
	export PS1="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
fi

if [ "$(uname)" = 'Darwin' ];
then
    export CLAUDE_CONFIG_DIR="$HOME/.config/claude"
    export CODEX_HOME="$HOME/.config/codex"

	[ -r ~/.private ] && source ~/.private || echo "Not found .private"

	# ------------------ macport -------------------
	if test -f /opt/local/bin/port;
	then
		export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
		export MANPATH="/opt/local/share/man:$MANPATH"
	fi

	# ------------------ brew -------------------
    if test -f /opt/homebrew/bin/brew; 
	then
		if [[ ! -z "$BASH" && -f $(brew --prefix)/etc/bash_completion ]]; then
			. $(brew --prefix)/etc/bash_completion
		fi
		# WARN:  Please set HOMEBREW_GITHUB_API_TOKEN in ~/.bashrc
		if [[  -f `brew --prefix`/bin/ctags ]]; then
			alias ctags="`brew --prefix`/bin/ctags"
		fi
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi

	# -------------------- tmux -------------------------
	function tmux-init() {
        if >/dev/null command -v tmux && >/dev/null command -v tmuxp; 
        then
            tmux attach -t init || tmuxp load -y init
        else
            echo "tmux and tmuxp not found"
        fi
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

	# ------------------ Android -----------------
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    JBR_PATH=/Applications/"Android Studio.app"/Contents/jbr
    if test -d "$JBR_PATH";
    then
        export JAVA_HOME="$JBR_PATH/Contents/Home"
        export PATH="$JAVA_HOME/bin:$PATH"
    fi
fi


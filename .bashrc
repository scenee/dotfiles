# macOS doesn't read .bashrc file on bash start. Instead, it reads the following files (in the following order):
# 1. /etc/profile
# 2. ~/.bash_profile
# 3. ~/.bash_login
# 4. ~/.profile
# Ref https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically

if [ "$(uname)" == 'Darwin' ]; then
	export MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"
	export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
else
	[ -r ~/.profile ] && source ~/.profile || echo "Not found ~/.profile"
fi


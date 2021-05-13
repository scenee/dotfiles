alias mux="tmuxinator"
function git-root
    set path (git rev-parse --show-toplevel); or set path $PWD
    cd $path
end
funcsave git-root


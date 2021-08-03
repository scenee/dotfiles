# Defined in /Users/shin/.config/fish/config.fish @ line 5
function git-root
    set path (git rev-parse --show-toplevel); or set path $PWD
    cd $path
end

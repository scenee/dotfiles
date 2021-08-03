# Defined in /Users/shin/.config/fish/config.fish @ line 11
function glist
    set --local root (ghq root)
    set --local subpath (ghq list | fzf)
    if test -n $path
        pushd $root/$subpath
    end
end

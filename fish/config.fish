alias mux="tmuxinator"
alias studio="open -a /Applications/Android\ Studio.app"
alias getplain="pbpaste | pbcopy"

function git-root
    set path (git rev-parse --show-toplevel); or set path $PWD
    cd $path
end
funcsave git-root

function glist
    set --local root (ghq root)
    set --local subpath (ghq list | fzf)
    if test -n $path
        pushd $root/$subpath
    end
end
funcsave glist

function gget
    ghq get $argv
end
funcsave gget


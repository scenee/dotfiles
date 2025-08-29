# Alias

## lazygit

# See also https://github.com/jesseduffield/lazygit?tab=readme-ov-file#changing-directory-on-exit
function lg
    set -x LAZYGIT_NEW_DIR_FILE ~/.local/lazygit/new_dir

    lazygit $argv

    if test -f "$LAZYGIT_NEW_DIR_FILE"
        set new_dir (cat "$LAZYGIT_NEW_DIR_FILE")

        rm -f "$LAZYGIT_NEW_DIR_FILE"

        if test -d "$new_dir"
            set current_repo_root (git -C (pwd) rev-parse --show-toplevel 2>/dev/null)
            set new_repo_root (git -C "$new_dir" rev-parse --show-toplevel 2>/dev/null)

            if test "$current_repo_root" != "$new_repo_root"
                pushd "$new_dir"
            end
        end
    end
end

## util

alias getplain="pbpaste | pbcopy"

## editors

alias xcode="open -a Xcode.app"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias studio="open -a /Applications/Android\ Studio.app"

## tmuxp

alias mx='tmuxp'
alias fmx='tmuxp ls | fzf --layout=reverse --info=inline --height=40% --print0 | xargs -0 -o tmuxp load'
alias kmx='tmux list-sessions | cut -d" " -f1 | cut -d":" -f1 | fzf --layout reverse --info=inline --height=40% | xargs tmux kill-session -t'

## corepack

alias pn='corepack pnpm'
alias yarn='corepack yarn'


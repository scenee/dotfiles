# Binds

bind \cd delete-char # Stop an unexpected exit

# Variables

if status --is-login
    set -U fish_color_cwd normal
    set -U fish_color_user normal
    set -U fish_color_comment 6272A4
end

# Private

source ~/.config/fish/private.fish

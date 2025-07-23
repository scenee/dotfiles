# dart

fish_add_path "$HOME/.pub-cache/bin"


# asdf: This is a workaround for PATH in tmux

fish_add_path "$HOME/.local/asdf/shims"


# android

fish_add_path $HOME/Library/Android/sdk/platform-tools


# google-cloud-sdk

if [ -f "$HOME/.local/google-cloud-sdk/path.fish.inc" ]; .  "$HOME/.local/google-cloud-sdk/path.fish.inc"; end

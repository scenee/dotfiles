# dart

fish_add_path "$HOME/.pub-cache/bin"


# asdf: This is a workaround for PATH in tmux

fish_add_path "$HOME/.local/asdf/shims"


# android

fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/Library/Android/sdk/cmdline-tools/latest/bin

set -gx PATH $PATH $HOME/Library/Android/sdk/build-tools/36.0.0
set -gx ANDROID_NDK_HOME $HOME/Library/Android/sdk/ndk/27.0.12077973


# google-cloud-sdk

if [ -f "$HOME/.local/google-cloud-sdk/path.fish.inc" ]; .  "$HOME/.local/google-cloud-sdk/path.fish.inc"; end

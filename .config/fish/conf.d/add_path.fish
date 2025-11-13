# asdf

# fish_add_path can't add this path before /usr/local/bin
set -gx PATH "$HOME/.local/share/asdf/shims" $PATH

# android

fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/Library/Android/sdk/cmdline-tools/latest/bin
fish_add_path /Applications/"Android Studio.app"/Contents/jbr/Contents/Home/bin

## for swift android sdk

set android_build_tools_dirs $HOME/Library/Android/sdk/build-tools/*
set android_ndk_dirs $HOME/Library/Android/sdk/ndk/*
if test -n "$android_build_tools_dirs"
    set -gx PATH "$PATH" "$android_build_tools_dirs[-1]"
end
if test -n "$android_ndk_dirs"
    set -gx ANDROID_NDK_HOME $android_ndk_dirs[-1]
end
set -e android_build_tools_dirs
set -e android_ndk_dirs 

# google-cloud-sdk

set -gx PATH $PATH $HOME/.local/share/google-cloud-sdk/bin
if [ -f "$HOME/.local/share/google-cloud-sdk/path.fish.inc" ]
    source  "$HOME/.local/share/google-cloud-sdk/path.fish.inc"
end


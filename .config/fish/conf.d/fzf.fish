function fz
    # fzfでファイルパスを選択させる
    set -l selected_files (fzf --tac --layout=reverse)

    # 選択されたファイルがあれば、vimを起動する
    if test (count $selected_files) -gt 0
        # コマンド置換で得られたファイルパスを直接vimの引数にする
        vim $selected_files
    end
end


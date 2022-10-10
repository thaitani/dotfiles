# # 補完候補で、大文字・小文字を区別しないで補完出来るようにするが、大文字を入力した場合は区別する
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# # ../ の後は今いるディレクトリを補間しない
# zstyle ':completion:*' ignore-parents parent pwd ..
# # 補間候補一覧上で移動できるように
# zstyle ':completion:*:default' menu select=1
# # 補間候補にカレントディレクトリは含めない
# zstyle ':completion:*:cd:*' ignore-parents parent pwd

# # ヒストリの設定
# HISTFILE=~/.zsh_history
# HISTSIZE=50000
# SAVEHIST=50000

# # 直前のコマンドの重複を削除
# setopt hist_ignore_dups
# # 同じコマンドをヒストリに残さない
# setopt hist_ignore_all_dups
# # 同時に起動したzshの間でヒストリを共有
# setopt share_history
# # historyに保存するときに余分なスペースを削除する
# setopt hist_ignore_space
# setopt hist_reduce_blanks
# # 重複するコマンドが保存されるとき、古い方を削除する
# setopt hist_save_no_dups
# # 補完機能を有効にする
# autoload -Uz compinit
# compinit -u
# if [ -e /usr/local/share/zsh-completions ]; then
#   fpath=(/usr/local/share/zsh-completions $fpath)
# fi

# # 補完で小文字でも大文字にマッチさせる
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# # 補完候補を詰めて表示
# setopt list_packed

# # 補完候補一覧をカラー表示
# autoload colors
# zstyle ':completion:*' list-colors ''

# # コマンドのスペルを訂正
# setopt correct
# # ビープ音を鳴らさない
# setopt no_beep

# # ディレクトリスタック
# DIRSTACKSIZE=100
# setopt AUTO_PUSHD

# autoload -U promptinit; promptinit
# prompt pure
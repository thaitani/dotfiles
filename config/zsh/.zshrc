### zinit ###
typeset -gAH ZINIT
ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
ZINIT[ZCOMPDUMP_PATH]="$XDG_STATE_HOME/zcompdump"
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

### path ###
typeset -U path

path=(
    "$PUB_CACHE/bin"(N-/)
    "$FVM_HOME/default/bin"(N-/)
    "$path[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

# cd時に自動でpush
setopt auto_pushd
# 直前のコマンドの重複削除
setopt pushd_ignore_dups
# ドット指定なしでドットファイルマッチ
setopt globdots
# 上書きせず追加
setopt append_history
# zshの開始、終了時間を記録
setopt extended_history
# 同じコマンドを残さない
setopt hist_ignore_all_dups
# 余分なスペースを削除
setopt hist_ignore_space
setopt hist_reduce_blanks
# 重複コマンドの古い方を削除
setopt hist_save_no_dups
# #以降をコメント扱い
setopt interactive_comments
# ヒストリを共有
setopt share_history
# 補完強化
setopt magic_equal_subst
# 出力時8ビットを通す
setopt print_eight_bit
# ビープ音を鳴らさない
setopt no_beep

### asdf ###
__asdf_atload() {
    export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
    export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
}
zinit wait lucid light-mode for \
    atpull'asdf plugin update --all' \
    atload'__asdf_atload' \
    @'asdf-vm/asdf'

### yq ###
zinit wait lucid light-mode as'program' from'gh-r' for \
    mv'yq* -> yq' \
    atclone'./yq shell-completion zsh >_yq' atpull'%atclone' \
    @'mikefarah/yq'

### bat ###
__bat_atload() {
    alias less='bat'
    # pagingを無効
    alias cat='bat --paging=never'
}
zinit wait lucid light-mode as'program' from'gh-r' for \
    pick'bat*/bat' \
    atload'__bat_atload' \
    @'sharkdp/bat'

__lsd_atload() {
    # ファイル→ディレクトの順でほぼ全て表示（.と..は除く）
    alias ls='lsd -A --group-dirs=last'
    # サイズが人に優しいリスト表示で、ディレクトリのサイズは中のファイルの合計を表示
    alias ll='lsd -Ahl --total-size --group-dirs=last'
    # ツリー表示
    alias tree='lsd -A --tree --group-dirs=last'
    # ツリー形式でファイル情報も表示
    alias lr='lsd -Ahl --total-size --tree --group-dirs=last'
}
zinit wait lucid light-mode as'program' from'gh-r' for \
    pick'lsd*/lsd' \
    atload'__lsd_atload' \
    @'Peltoche/lsd'

### zsh plugins ###
zinit for \
    light-mode \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \

### completion styles ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Editor ###
export EDITOR="vi"
(( ${+commands[vim]} )) && EDITOR="vim"

export GIT_EDITOR="$EDITOR"

zpcompinit
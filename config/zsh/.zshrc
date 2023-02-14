# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
### brew ###
eval "$(/opt/homebrew/bin/brew shellenv)"

### 1Password ###
source ~/.config/op/plugins.sh

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
  "$NPM_DATA_DIR/bin"(N-/)
  "$DENO_INSTALL/bin"(N-/)
  "$path[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
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

# history除外設定
zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|l[sal]|rm|rmdir|exit)($| )" ]]
}

### git repo create ###
ghcr() {
  gh repo create $argv
  ghq get $argv[1]
  code $(ghq list --full-path -e $argv[1])
}

### git repo open ###
ghcode() {
  local repo="$(ghq list -p | fzf)"
  code $repo
}

### key bindings ###
# widget::history() {
#   local selected="$(history -inr 1 | fzf --exit-0 --query "$LBUFFER" | cut -d' ' -f4- | sed 's/\\n/\n/g')"
#   if [ -n "$selected" ]; then
#     BUFFER="$selected"
#     CURSOR=$#BUFFER
#   fi
#   zle -R -c # refresh screen
# }
# zle -N widget::history
# bindkey "^R" widget::history

bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

### starship(warpを除く) ###
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  eval "$(starship init zsh)"
fi

### plugins ###
zinit wait lucid null for \
  atinit'source "$ZDOTDIR/.lazy.zshrc"' \
  @'zdharma-continuum/null'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
### brew ###
eval "$(/opt/homebrew/bin/brew shellenv)"

### sheldon ###
eval "$(sheldon source)"

### 1Password ###
source ~/.config/op/plugins.sh

### direnv ###
eval "$(direnv hook zsh)"

### path ###
typeset -U path
path=(
  "$XDG_CONFIG_HOME/bin"(N-/)
  "$PUB_CACHE/bin"(N-/)
  "$FVM_CACHE_PATH/default/bin"(N-/)
  "$NPM_DATA_DIR/bin"(N-/)
  "$DENO_INSTALL/bin"(N-/)
  "$PNPM_HOME"(N-/)
  "$ANDROID_HOME/platform-tools"(N-/)
  "$ANDROID_HOME/cmdline-tools/latest/bin"(N-/)
  "$ANDROID_HOME/emulator"(N-/)
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"(N-/)
  "$path[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export HISTSIZE=12000
export SAVEHIST=10000

# history除外設定
zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|l[sal]|rm|rmdir|exit)($| )" ]]
}

### fzf ###
export FZF_DEFAULT_OPTS='--reverse --border --ansi --bind="ctrl-d:print-query,ctrl-p:replace-query"'
export FZF_DEFAULT_COMMAND='fd --hidden --color=always'

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
# 補完強化
setopt magic_equal_subst
# 出力時8ビットを通す
setopt print_eight_bit
# ビープ音を鳴らさない
setopt no_beep

### functions ###
source "$ZDOTDIR/.functions.zsh"

### aliases ###
source "$ZDOTDIR/.aliases.zsh"

### custom widgets ###
source "$ZDOTDIR/.widgets.zsh"

### key bindings ###
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey '^R' __fzf_history_selection
bindkey '^G' __fzf_ghq_cd
bindkey '^N' __navi_search

### starship ###
eval "$(starship init zsh)"

### completion styles ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Editor ###
export EDITOR="vi"
(( ${+commands[vim]} )) && EDITOR="vim"

export GIT_EDITOR="$EDITOR"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

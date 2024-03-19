# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
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
  "$XDG_CONFIG_HOME/bin"(N-/)
  "$PUB_CACHE/bin"(N-/)
  "$FVM_HOME/default/bin"(N-/)
  "$NPM_DATA_DIR/bin"(N-/)
  "$DENO_INSTALL/bin"(N-/)
  "$PNPM_HOME"(N-/)
  "$path[@]"
)
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export HISTSIZE=12000
export SAVEHIST=10000

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

### git repo clone ###
ghget() {
  local repo="$(gh repo list --json nameWithOwner,description,isPrivate,pushedAt -t '{{- range .}}
  {{- if .isPrivate}}
    {{- tablerow .nameWithOwner (printf "%.50s" .description) "Private" (timeago .pushedAt)}}
  {{- else}}
    {{- tablerow .nameWithOwner (printf "%.50s" .description) "Public" (timeago .pushedAt)}}
  {{- end}}
  {{- end}}' \
  | fzf | awk '{print $1}')"
  if [ "$repo" = "" ]; then
    return
  fi
  ghq get $repo
}

### git sim ###
# https://github.com/initialcommit-com/git-sim#docker-installation
git-sim() {
  docker run --rm -v $(pwd):/usr/src/git-sim git-sim "$@"
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

### VSCode以外 ###
if [ "$VSCODE_PID" = "" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  ### tmux ###
  if [[ ! -n $TMUX && $- == *l* ]]; then
    # get the IDs
    ID="`tmux list-sessions`"
    if [[ -z "$ID" ]]; then
      tmux new-session
    fi
    create_new_session="Create New Session"
    ID="$ID\n${create_new_session}:"
    ID="`echo $ID | fzf | cut -d: -f1`"
    if [[ "$ID" = "${create_new_session}" ]]; then
      tmux new-session
    elif [[ -n "$ID" ]]; then
      tmux attach-session -t "$ID"
    else
      :  # Start terminal normally
    fi
  fi
fi

### warp以外###
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ### starship ###
  eval "$(starship init zsh)"
fi

### plugins ###
zinit wait lucid null for \
  atinit'source "$ZDOTDIR/.lazy.zshrc"' \
  @'zdharma-continuum/null'

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

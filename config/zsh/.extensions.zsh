### aliases ###
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
(( ${+commands[trash]} )) && alias rm='trash'

### fvm ###
alias flutter='fvm flutter'
alias dart='fvm dart'

### functions ###
mkcd() {
  command mkdir -p -- "$@" && builtin cd "${@[-1]:a}"
}

### asdf ###
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
zinit lucid light-mode for \
  @'asdf-vm/asdf'
source "$ASDF_DIR/asdf.sh"

### direnv ###
zinit lucid light-mode as'program' from'gh-r' for \
  mv'direnv* -> direnv' \
  @'direnv/direnv'
eval "$(direnv hook zsh)"

### yq ###
zinit lucid light-mode as'program' from'gh-r' for \
  mv'yq* -> yq' \
  atclone'./yq shell-completion zsh >_yq' atpull'%atclone' \
  @'mikefarah/yq'

### bat ###
zinit lucid light-mode as'program' from'gh-r' for \
  pick'bat*/bat' \
  @'sharkdp/bat'
alias less='bat'
# pagingを無効
alias cat='bat --paging=never'

### lsd ###
zinit lucid light-mode as'program' from'gh-r' for \
  pick'lsd*/lsd' \
  @'Peltoche/lsd'
# ファイル→ディレクトの順でほぼ全て表示（.と..は除く）
alias ls='lsd -A --group-dirs=last'
# サイズが人に優しいリスト表示で、ディレクトリのサイズは中のファイルの合計を表示
alias ll='lsd -Ahl --total-size --group-dirs=last'
# ツリー表示
alias tree='lsd -A --tree --group-dirs=last'
# ツリー形式でファイル情報も表示
alias lr='lsd -Ahl --total-size --tree --group-dirs=last'

### navi ###
__navi_search() {
  LBUFFER="$(navi --print --query="$LBUFFER")"
  zle reset-prompt
}
export NAVI_PATH="$XDG_DATA_HOME/navi/"
export NAVI_CONFIG="$XDG_CONFIG_HOME/navi/config.yaml"
zinit lucid light-mode as'program' from'gh-r' bpick'*apple-darwin*' for \
  @'denisidoro/navi'
zle -N __navi_search
bindkey '^N' __navi_search

### custom widgets ###
source "$ZDOTDIR/.widgets.zsh"

bindkey '^R' __fzf_history_selection
bindkey '^G' __fzf_ghq_cd

### zsh plugins ###
zinit lucid blockf light-mode for \
  @'zsh-users/zsh-completions' \
  @'zdharma-continuum/fast-syntax-highlighting' \

### completion styles ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Editor ###
export EDITOR="vi"
(( ${+commands[vim]} )) && EDITOR="vim"

export GIT_EDITOR="$EDITOR"

zpcompinit

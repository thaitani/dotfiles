### aliases ###
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
(( ${+commands[trash]} )) && alias rm='trash'

### functions ###
mkcd() {
    command mkdir -p -- "$@" && builtin cd "${@[-1]:a}"
}

### asdf ###
__asdf_atload() {
    export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
    export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
    source $ASDF_DIR/asdf.sh
}
zinit wait lucid light-mode for \
    atpull'asdf plugin update --all' \
    atload'__asdf_atload' \
    @'asdf-vm/asdf'

### direnv ###
__direnv_atload() {
    eval "$(direnv hook zsh)"
}
zinit wait lucid light-mode as'program' from'gh-r' for \
    mv'direnv* -> direnv' \
    atload'__direnv_atload' \
    @'direnv/direnv'

### fzf ###
__fzf_atload() {
    export FZF_DEFAULT_OPTS='--reverse --border --ansi --bind="ctrl-d:print-query,ctrl-p:replace-query"'
    export FZF_DEFAULT_COMMAND='fd --hidden --color=always'
}
zinit wait lucid light-mode as'program' from'gh-r' for \
    mv'fzf* -> fzf' \
    atclone'./fzf shell-completion zsh >_fzf' atpull'%atclone' \
    @'junegunn/fzf'

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

### lsd ###
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

# ### navi ###
__navi_search() {
    LBUFFER="$(navi --print --query="$LBUFFER")"
    zle reset-prompt
}
__navi_atload() {
    export NAVI_CONFIG="$XDG_CONFIG_HOME/navi/config.yaml"

    zle -N __navi_search
    bindkey '^N' __navi_search
}
zinit wait lucid light-mode as'program' from'gh-r' bpick'*apple-darwin*' for \
    atload'__navi_atload' \
    @'denisidoro/navi'

### zeno.zsh ###
__zeno_atload() {
    export ZENO_HOME="$XDG_CONFIG_HOME/zeno"
    export ZENO_ENABLE_SOCK=1
    export ZENO_GIT_CAT="bat --color=always"
    export ZENO_GIT_TREE="exa --tree"

    bindkey ' '  zeno-auto-snippet
    bindkey '^M' zeno-auto-snippet-and-accept-line
    bindkey '^I' zeno-completion
}

zinit wait lucid light-mode for \
    atload'__zeno_atload' \
    @'yuki-yano/zeno.zsh'

### zsh plugins ###
zinit wait lucid blockf light-mode for \
  @'zsh-users/zsh-autosuggestions' \
  @'zsh-users/zsh-completions' \
  @'zdharma-continuum/fast-syntax-highlighting' \
  @'zdharma-continuum/history-search-multi-word' \

### completion styles ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Editor ###
export EDITOR="vi"
(( ${+commands[vim]} )) && EDITOR="vim"

export GIT_EDITOR="$EDITOR"

zpcompinit
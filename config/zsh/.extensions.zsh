
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

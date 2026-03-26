### fzf widgets ###
__fzf_history_selection() {
  emulate -L zsh
  setopt localoptions pipefail no_aliases

  local -a fzf_args

  fzf_args+=(
    --no-sort
    --exact
    --no-multi
    "--query=$LBUFFER"
    "--prompt=History> "
    "--with-nth=2.."
  )

  if whence -p bat >/dev/null 2>&1; then
    local preview_cmd
    preview_cmd=$'echo {} | perl -pe "s/^[\\s\\t]*[0-9]*[\\s\\t]*//" | bat --color=always --language=sh --style=plain'
    fzf_args+=(--preview "$preview_cmd" --preview-window down)
  fi

  local selection
  if ! selection=$(builtin history -r 1 | fzf "${fzf_args[@]}"); then
    zle reset-prompt
    return
  fi

  selection=${selection%%$'\n'*}
  if [[ -z $selection ]]; then
    zle reset-prompt
    return
  fi

  local -a parts=(${=selection})
  local history_index=${parts[1]}

  if [[ -z $history_index ]]; then
    zle reset-prompt
    return
  fi

  zle vi-fetch-history -n "$history_index"
  zle reset-prompt
}

__fzf_ghq_cd() {
  emulate -L zsh
  setopt localoptions pipefail no_aliases

  local repo
  repo="$(
    ghq list -p \
      | fzf --exit-0
  )" || return 0

  if [[ -n "$repo" ]]; then
    builtin cd -- "$repo" || return 1
    BUFFER=""
    CURSOR=0
  fi

  zle reset-prompt
}

zle -N __fzf_history_selection
zle -N __fzf_ghq_cd

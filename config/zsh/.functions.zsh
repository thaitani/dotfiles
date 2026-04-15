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

### mkdir and cd ###
mkcd() {
  command mkdir -p -- "$@" && builtin cd "${@[-1]:a}"
}

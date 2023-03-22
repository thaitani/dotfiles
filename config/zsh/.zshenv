### locale ###
export LANG="ja_JP.UTF-8"
export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### zsh ###
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

### flutter ###
export FVM_HOME="$XDG_DATA_HOME/fvm"
export PUB_CACHE="$XDG_CACHE_HOME/.pub-cache"

### Node.js ###
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_history"

### npm ###
export NPM_CONFIG_DIR="$XDG_CONFIG_HOME/npm"
export NPM_DATA_DIR="$XDG_DATA_HOME/npm"
export NPM_CACHE_DIR="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$NPM_CONFIG_DIR/npmrc"

### docker ###
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export MINIKUBE_HOME="$XDG_DATA_HOME/minikube"

### homebrew ###
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"

### Deno ###
export DENO_INSTALL="$XDG_DATA_HOME/deno"

### gibo ###
export GIBO_BOILERPLATES="$XDG_CACHE_HOME/.gitignore-boilerplates"

### pnpm ###
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

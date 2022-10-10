#!/usr/bin/env bash
set -eux
# shellcheck source=./setup_scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/homebrew.bash"
/bin/bash "$CUR_DIR/links.bash"
# /bin/bash "$CUR_DIR/mac.bash"
/bin/bash "$CUR_DIR/zinit.bash"
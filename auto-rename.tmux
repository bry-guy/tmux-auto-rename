#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/variables.sh"
source "$CURRENT_DIR/scripts/helpers.sh"

tmux bind-key a run-shell "$CURRENT_DIR/scripts/rename.sh"

set_hooks() {
    tmux set-hook -g "after-select-pane" "run-shell $CURRENT_DIR/scripts/rename.sh"
    tmux set-hook -g "after-select-window" "run-shell $CURRENT_DIR/scripts/rename.sh"
    tmux set-hook -g "after-new-window" "run-shell $CURRENT_DIR/scripts/rename.sh"
    tmux set-hook -g "after-refresh-client" "run-shell $CURRENT_DIR/scripts/rename.sh"
}

main() {
    set_hooks
}
main


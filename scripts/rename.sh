#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/variables.sh"
source "$CURRENT_DIR/helpers.sh"

check() {
    # Check if automatic rename only in Git repositories
    local git_only_=$(get_tmux_option "$git_only" "$default_git_only")
    if [ $git_only_ == "on" ] && [ "$is_git" != "true" ]; then
        exit 0
    fi
}

get_current_dir() {
    if [ $is_git == "true" ]; then
        current_dir="$( cd "$( tmux display -p "#{pane_current_path}")" && basename $(git rev-parse --show-toplevel))"
    else
        current_dir="$(basename "$( tmux display -p "#{pane_current_path}" )")"
    fi
}

process_name() {
		if [ "$current_dir" == "$(echo $HOME | xargs basename)" ]; then
				current_dir="~"
		fi
}

rename_window() {
    tmux rename-window $current_dir
}

main() {
    check
    get_current_dir
    process_name
    rename_window
}
main



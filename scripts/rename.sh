#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/variables.sh"
source "$CURRENT_DIR/helpers.sh"

check_git_only() {
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

replace_home() {
		local replace_home=$(get_tmux_option "$replace_home" "$default_replace_home")
		if [ $replace_home == "true" ]; then
				if [ $current_dir == "$(echo $HOME | xargs basename)" ]; then
						current_dir="~"
				fi
		fi
}

rename_window() {
    tmux rename-window $current_dir
}

main() {
    check_git_only
    get_current_dir
    replace_home
    rename_window
}
main



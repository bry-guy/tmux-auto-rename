## Git Directories Only
git_only="@auto-rename-git-only"
default_git_only="on"

is_git="$(cd "$( tmux display -p "#{pane_current_path}" )" && git rev-parse --is-inside-work-tree 2>/dev/null)"

## Replace Home 
replace_home="@auto-rename-replace-home"
default_replace_home="on"

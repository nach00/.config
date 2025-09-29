# ~/.config/zsh/functions.zsh
# Custom shell functions

# Git helper functions
lazyg() {
    git add .
    git commit -m "$1"
    git push
}

lg() {
    git add .
    gitmoji -c
}

# Commented out original git functions, as lazyg and lg seem to be replacements
# gam() {
#     git add .
#     gitmoji -c
# }
# gcom() {
# 	git add .
# 	git commit -m "$1"
# }

# Custom nvim launcher with session restore on specific exit code
function nvim() {
  command nvim "$@"
  local exit_code=$?
  # Loop to reload last session if nvim exits with code 1 (e.g., :qall! from session view)
  while [ $exit_code -eq 1 ]; do
    echo "Neovim exited with code 1, attempting to reload last session..."
    command nvim "$@" -c "SessionLoadLast" # Adjust SessionLoadLast if your plugin uses a different command
    exit_code=$?
  done
}

# # tmux-window-rename plugin helper
# # Ensure the script path is correct or use $TMUX_PLUGIN_MANAGER_PATH
# tmux-window-name() {
# 	# Check if TMUX_PLUGIN_MANAGER_PATH is set and prefer it
# 	local script_path="$HOME/.config/tmux/plugins/tmux-window-name/scripts/rename_session_windows.py"
# 	if [ -n "$TMUX_PLUGIN_MANAGER_PATH" ]; then
# 		script_path="$TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py"
# 	fi
#
# 	if [ -f "$script_path" ]; then
# 		("$script_path" &)
# 	else
# 		echo "tmux-window-name script not found at $script_path" >&2
# 	fi
# }
# # Hook for tmux-window-name
# # `add-zsh-hook` requires Zsh 5.2+. If older, you might need `chpwd_functions` array.
# if type add-zsh-hook >/dev/null 2>&1; then
#   add-zsh-hook chpwd tmux-window-name
# else
#   # Fallback for older Zsh versions
#   if [[ -z "$chpwd_functions" || ! ( "$chpwd_functions"[(I)tmux-window-name] ) ]]; then
#     chpwd_functions+=("tmux-window-name")
#   fi
# fi

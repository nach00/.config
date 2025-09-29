# ~/.config/zsh/completions.zsh
# Zsh completion system settings and plugin sourcing for completions/syntax highlighting

# --- Zsh Completion System Configuration (zstyle) ---
# These are fine-grained controls for Zsh's built-in completion.
# Ensure compinit is initialized for these to take effect.
# It's often initialized by plugin managers (like Oh-My-Zsh) or can be done manually.
# If not using a framework that calls it, add near the top of .zshrc or here:
# autoload -Uz compinit && compinit

# zstyle ':completion:*:*:cp:*' file-sort size
# zstyle ':completion:*' file-sort modification
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache" # Use XDG base dir
# zstyle ':completion:*:*:cp:*' file-sort modification reverse
# zstyle ':completion:*' verbose yes # Can be noisy, consider commenting out if too much info
# zstyle ':completion:*' completer _extensions _complete _approximate
# zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# zstyle ':completion:*' menu select # Enable menu selection for completions
# zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:descriptions' format '%U%K{yellow} %F{green}-- %F{red} %BNICE!1! %b%f %d --%f%k%u'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' file-list all
# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' complete-options true
# zstyle ':completion:*' squeeze-slashes true
# zstyle ':completion:*' file-sort dummyvalue # This seems like a placeholder or an odd value. Review if needed.
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
# zstyle ':completion:*' file-sort change reverse
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Alias expansion (experimental/advanced)
# zle -C alias-expension complete-word _generic
# bindkey '^a' alias-expension # Ctrl-A for alias expansion
# zstyle ':completion:alias-expension:*' completer _expand_alias
# zmodload zsh/complist

# Keybindings for menu selection (if using menu select)
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-down-line-or-history # 'a' for up might be vi-up-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history   # 'e' for down might be vi-down-line-or-history
# bindkey -M menuselect 'l' vi-forward-char         # 'i' for forward might be vi-forward-char
# bindkey -M menuselect '^xi' vi-insert # This seems specific, ensure it's what you want

# setopt MENU_COMPLETE # This is often enabled by `zstyle ':completion:*' menu select` but can be set explicitly.

# --- Completion/Syntax Highlighting/Autosuggestion Plugins (Manual Sourcing) ---
# These are commented out from your original config.
# If you install these (e.g., via Homebrew), you can uncomment them.
# Ensure paths are correct for your system (brew --prefix is good for Homebrew).

# Zsh Autosuggestions
# if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
#   source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
#   bindkey '^ ' autosuggest-accept # Use Ctrl+Space to accept the suggestion
#   # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# fi

# Zsh Completions (additional community completions)
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src # This path is OMZ-specific
# If installed via brew:
# FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
# You might need to re-run compinit after changing FPATH:
# autoload -Uz compinit && compinit -i

# Zsh History Substring Search
# if [ -f "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
#   source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
#   # You might need to bind keys for this, e.g., UP and DOWN arrows
#   # bindkey '^[[A' history-substring-search-up
#   # bindkey '^[[B' history-substring-search-down
# fi

# Zsh Syntax Highlighting
# Must be sourced AT THE END of .zshrc or related files.
# if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
#   source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# fi

# Zsh Vi Mode (Plugin)
# source ~/.oh-my-zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh # OMZ specific path

# Zsh Autocomplete (Advanced completion system)
# source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh # OMZ specific path

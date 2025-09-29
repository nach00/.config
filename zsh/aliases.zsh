# ~/.config/zsh/aliases.zsh
# Shell Aliases

# Navigation
alias ..='z .. && ls'
alias ...='z ../.. && ls'
alias ....='z ../../.. && ls'
alias .....='z ../../../.. && ls'

# Common command overrides
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rmf='rm -rf' # Be careful with this one!
alias cat='bat'    # Assumes bat is installed

# System & Info
alias h='history'
alias ports='netstat -tulanp'
alias svcs='systemctl --type=service' # systemctl is Linux-specific; on macOS, use `launchctl list` or similar

# Zshrc editing
alias ez='nvim ~/.zshrc'
alias rz='source ~/.zshrc'

# Tmux
alias t='tmux'
alias et='nvim ~/.config/tmux/tmux.conf'
alias rt='tmux source-file ~/.config/tmux/tmux.conf'
alias ut='~/.tmux/plugins/tpm/bin/update_plugins all'
alias kt='tmux kill-server'

# Editor Configs (Neovim)
alias n='nvim'
alias nn="/$HOME/nvim-nightly/bin/nvim" # Neovim nightly

alias ey='nvim ~/.config/yabai/yabairc'
alias es='nvim ~/.config/skhd/skhdrc'
alias eg='nvim ~/.config/ghostty/config'

# Neovim Keymaps
alias ekb='nvim ~/.config/nvim/lua/config/keymaps/buffers.lua'
alias eke='nvim ~/.config/nvim/lua/config/keymaps/editor.lua'
alias ekm='nvim ~/.config/nvim/lua/config/keymaps/movement.lua'
alias ekp='nvim ~/.config/nvim/lua/config/keymaps/plugins.lua'
alias ekt='nvim ~/.config/nvim/lua/config/keymaps/tmux.lua'

# Neovim Config
alias eca='nvim ~/.config/nvim/lua/config/autocmds.lua'

# Listing files (using eza)
alias ls='eza --icons'
alias la='eza -la --icons'
# Old ls aliases (commented out as eza is preferred)
# alias l='ls -aFhl --color=auto'
# alias ls='ls --color=auto' # System ls
# alias e='eza --icons' # Covered by `ls`
# alias el='eza -la --icons' # Covered by `la`
# alias ls='lsd'
# alias l='ls -l'
# alias la='ls -a'
# alias lla='ls -la'


# Git
alias gmj='gitmoji -c'
alias gph='git push heroku main'

# Python (if specific version needed, pyenv handles this better generally)
# alias python3='/usr/bin/python3'
# alias python=/usr/bin/python3

# Other tools
alias claude="/Users/jazz/.claude/local/claude"

# SSH
alias penguin="ssh -p 2222 npradappet@192.168.1.22"
alias ender="ssh pi@ender3.local"

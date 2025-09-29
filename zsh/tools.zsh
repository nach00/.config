# ~/.config/zsh/tools.zsh
# Initialization for various command-line tools

# Bun completions
[ -s "/Users/jazz/.bun/_bun" ] && source "/Users/jazz/.bun/_bun"

# Zoxide (replaces cd, tracks directories)
eval "$(zoxide init zsh)"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Mise (formerly rtx - polyglot runtime manager)
# This will manage Node, Python, Ruby etc. if configured.
# If you use mise for Python/Ruby/Node, you might not need pyenv/NVM/rbenv.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Pyenv (Python Version Manager)
# If using mise for Python, you can comment this out.
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  # eval "$(pyenv init -)" # This loads shims and autocompletion
                           # Consider if `pyenv init --path` is enough or if you need full init
                           # Full init can slow down shell startup slightly.
                           # If you use `pyenv init -`, place it after `mise activate` if both are used
                           # to ensure pyenv shims take precedence if desired.
fi


# Conda (Python environment and package manager)
# Commented out as it was in the original.
# If you use Conda, uncomment and ensure the path is correct.
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda3/bin:$PATH" # Make sure this doesn't conflict with pyenv/mise
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# rbenv (Ruby Version Manager)
# Commented out as mise or system ruby might be in use.
# If using mise for Ruby, you can comment this out.
# if command -v rbenv >/dev/null 2>&1; then
#   eval "$(rbenv init -)"
# fi

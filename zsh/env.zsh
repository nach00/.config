# ~/.config/zsh/env.zsh
# Environment variables and PATH modifications

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# WebStorm CLI
export PATH="/Applications/WebStorm.app/Contents/MacOS:$PATH"

# WezTerm CLI
export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"

# User local bin
export PATH="$HOME/.local/bin:$PATH"

# Note: Prepending /usr/bin is unusual and might override preferred versions
# from Homebrew or other package managers. Usually, system paths are at the end.
# If you have specific reasons, keep it; otherwise, consider removing or appending.
export PATH="/usr/bin:$PATH"

# PNPM
export PNPM_HOME="/Users/jazz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Ruby (Homebrew) & Gems
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="`gem env gemdir`/bin:$PATH" # Note: `gem env gemdir` might be slow on startup. Consider hardcoding or caching.

# LM Studio CLI
export PATH="$PATH:/Users/jazz/.lmstudio/bin" # Appending here as per original

# N8N Development Settings
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
export N8N_RUNNERS_ENABLED=true
export N8N_SECURE_COOKIE=false
export N8N_CONTENT_SECURITY_POLICY_REPORT_ONLY=true
export NODE_ENV=development
export N8N_HOST=localhost
export N8N_PORT=5678
export N8N_PROTOCOL=http
export WEBHOOK_URL=http://localhost:5678
export N8N_PAYLOAD_BODY_SIZE_MAX=50mb

# Default directory (example, if you want to start somewhere specific)
# cd ~/Sync/github # This was present but commented out, move to .zshrc if you want it on every shell

# ~/.config/zsh/macos.zsh
# macOS specific settings

# Set Neovide frame transparency (if Neovide is used)
if command -v launchctl >/dev/null 2>&1 && command -v neovide >/dev/null 2>&1; then
  launchctl setenv NEOVIDE_FRAME transparent
fi

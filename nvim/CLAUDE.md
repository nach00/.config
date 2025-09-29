# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a LazyVim-based Neovim configuration that extends the base LazyVim setup with custom plugins and configurations. The codebase follows a modular structure:

- **Base**: Built on LazyVim framework which provides sensible defaults and plugin management via lazy.nvim
- **Configuration Layer**: Custom configurations in `lua/config/` that override or extend LazyVim defaults
- **Plugin Layer**: Custom plugin configurations in `lua/plugins/` that add functionality beyond LazyVim's included plugins
- **Keymap Organization**: Keymaps are split into logical modules in `lua/config/keymaps/` for better organization

## Key Configuration Files

### Core Configuration
- `init.lua` - Entry point that bootstraps lazy.nvim and LazyVim
- `lua/config/lazy.lua` - Lazy.nvim setup with LazyVim integration and plugin loading
- `lua/config/options.lua` - Global Neovim options and autocmds, includes custom modules like smart-delete and simple-folding
- `lua/config/keymaps.lua` - Main keymap loader that requires all keymap modules

### Custom Modules
- `lua/config/smart-delete.lua` - Smart deletion that uses black hole register for empty lines
- `lua/config/simple-folding.lua` - Custom folding configuration (referenced but not read)

### Keymap Organization
Keymaps are organized into logical modules in `lua/config/keymaps/`:
- `buffers.lua` - Buffer-related keymaps
- `editor.lua` - General editor functionality
- `movement.lua` - Navigation and movement keymaps
- `plugins.lua` - Plugin-specific keymaps
- `quick-edit.lua` - Quick editing functions
- `tmux.lua` - Tmux integration (currently disabled)

### Plugin Configuration
- `lua/plugins/lspconfig.lua` - Comprehensive LSP configuration with support for multiple languages
- Individual plugin files in `lua/plugins/` for specific functionality

## Development Workflow

### Plugin Management
- Uses lazy.nvim for plugin management
- Plugin specifications are in `lua/plugins/` directory
- `lazy-lock.json` tracks exact plugin versions for reproducibility
- LazyVim provides the base plugin set, custom plugins extend functionality

### LSP Configuration
The LSP setup in `lua/plugins/lspconfig.lua` includes:
- Support for multiple languages: TypeScript, Lua, Ruby, Astro, CSS, MDX
- Comprehensive diagnostic configuration with custom icons
- Inlay hints and code lens support for Neovim 0.10+
- Mason integration for automatic LSP server installation
- Custom server configurations organized by language/framework

### Configuration Patterns
- Use `_G.map` and `_G.opts` for consistent keymap definitions
- Modular organization - split large configurations into focused files
- LazyVim integration - extend rather than replace LazyVim defaults
- Smart defaults - configurations that adapt to Neovim version capabilities

### File Structure Best Practices
- Keep plugin configurations in separate files in `lua/plugins/`
- Organize keymaps by functionality in `lua/config/keymaps/`
- Use descriptive filenames that indicate purpose
- Follow LazyVim conventions for plugin specification format

## Customization Guidelines

When making changes to this configuration:
1. Check if LazyVim already provides the functionality before adding new plugins
2. Use the existing keymap organization pattern when adding new keymaps
3. Follow the modular approach - create focused, single-purpose configuration files
4. Test with the existing LSP setup before making changes to language server configurations
5. Maintain compatibility with LazyVim's plugin loading patterns
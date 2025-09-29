-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
_G.map = vim.keymap.set

_G.opts = {
  noremap = true,
  silent = true,
}

require("config.keymaps.buffers")
require("config.keymaps.editor")
require("config.keymaps.movement")
require("config.keymaps.plugins")
require("config.keymaps.recurva")
require("config.keymaps.quick-edit")
require("config.keymaps.macos")
require("config.keymaps.leader")

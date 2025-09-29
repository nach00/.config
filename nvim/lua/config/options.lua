-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })
vim.diagnostic.config({ virtual_text = false })
-- vim.diagnostic.config({
--   virtual_text = {
--     severity = {
--       max = vim.diagnostic.severity.WARN,
--     },
--   },
--   virtual_lines = {
--     severity = {
--       min = vim.diagnostic.severity.ERROR,
--     },
--   },
-- })

-- vim.opt.cursorline = true
-- vim.opt.mouse = ""

---- Option 1: Set vertical scroll to 1 (and use high turn speed)
-- vim.opt.mousescroll = "ver:1,hor:6"

-- OR Option 2: Set vertical scroll to a higher value (and use one turn at a time)
-- vim.opt.mousescroll = "ver:1,hor:1"

-- vim.opt.mousescroll = ""
-- require("config.filetype")
require("config.smart-delete")
require("config.simple-folding")
-- require("mason-lspconfig").get_mappings().lspconfig_to_package
-- or alternatively (although not technically a public API)
-- require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package

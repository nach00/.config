-- local cinnamon = require("cinnamon")
-- Oil
-- map({ "n", "v" }, "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Fyler
-- map({ "n", "v" }, "_", "<CMD>Fyler<CR>", { desc = "Fyler explorer" })

-- Open oil with preview
vim.keymap.set("n", "-", function()
  local oil = require("oil")
  local util = require("oil.util")
  oil.open_float()
  util.run_after_load(0, function()
    oil.open_preview()
  end)
end, { desc = "oil: open file explorer with preview" })

-- Live Server
map("n", "<leader>'", "<cmd>LiveServerStart<CR>", { desc = "start server" })
map("n", '<leader>"', "<cmd>LiveServerStop<CR>", { desc = "stop server" })

-- Quickfix
map("n", "<leader>;", vim.diagnostic.setloclist, { desc = "quickfix list" })

-- Snacks
map("n", "<leader>/", "<cmd>lua Snacks.notifier.hide()<CR>", { desc = "dismiss notifications" })
map("n", "<leader>?", "<cmd>lua Snacks.notifier.show_history()<CR>", { desc = "show notifications" })

-- Telescope
-- map("n", "<leader>t", "<cmd><CR>", { desc = "+telescope" })
map("n", "<D-e>", "<cmd>Telescope frecency<CR>", { desc = "frecency" })
map("n", "<D-b>", "<cmd>Telescope smart_open<CR>", { desc = "smart open" })
-- map("n", "<leader>ta", "<cmd>Telescope oldfiles<CR>", { desc = "old files" })
-- map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "find buffer" })
-- map("n", "<leader>tc", "<cmd>Telescope cmdline<CR>", { desc = "cmdline" })
-- map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "diagnostics" })
-- map("n", "<leader>te", "<cmd>Telescope commands<CR>", { desc = "commands" })
-- map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "find files" })
-- map("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
-- map("n", "<leader>th", "<cmd>Telescope help_tags<CR>", { desc = "help tags" })
-- map("n", "<leader>ti", "<cmd>Telescope man_pages<CR>", { desc = "manual" })
-- map("n", "<leader>tj", "<cmd>Telescope registers<CR>", { desc = "registers" })
-- map("n", "<leader>tk", "<cmd>Telescope keymaps<CR>", { desc = "keymaps" })
-- map("n", "<leader>tm", "<cmd>Telescope gitmoji<CR>", { desc = "gitmoji" })
-- map("n", "<leader>tn", function()
--   require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "neovim config" })
-- map("n", "<leader>to", "<cmd>Telescope smart_open<CR>", { desc = "smart open" })
-- map("n", "<leader>tr", "<cmd>Telescope resume<CR>", { desc = "resume" })
-- map("n", "<leader>ts", "<cmd>Telescope builtin<CR>", { desc = "search telescope" })
-- map("n", "<leader>tt", "<cmd>Telescope tailiscope<CR>", { desc = "tailiscope" })
-- map("n", "<leader>tu", "<cmd>Telescope undo<CR>", { desc = "undo history" })
-- map("n", "<leader>tw", "<cmd>Telescope grep_string<CR>", { desc = "grep word" })
-- map("n", "<leader>ty", function()
--   require("telescope.builtin").current_buffer_fuzzy_find(
--     require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
--   )
-- end, { desc = "fuzzy find in buffer" })
-- map("n", "<leader>tz", function()
--   require("telescope.builtin").live_grep({ grep_open_files = true, prompt_title = "live grep (open files)" })
-- end, { desc = "open files" })

-- Import
map("n", "<leader>i", "<cmd>Telescope import<CR>", { desc = "telescope import" })
-- map("n", "<leader>i", require("lspimport").import, { desc = "resolve imports (python only)" })

-- Refactoring
-- map({ "n", "x" }, "<leader>h", function()
--   require("refactoring").select_refactor()
-- end, { desc = "refactor" })

-- Wrap in html tag
map({ "n", "v" }, "<leader>W", function()
  require("nvim-emmet").wrap_with_abbreviation()
end, { desc = "wrap html tag" })

-- -- load the session for the current directory
-- vim.keymap.set("n", "<leader>qs", function()
--   require("persistence").load()
-- end)
--
-- -- select a session to load
-- vim.keymap.set("n", "<leader>qS", function()
--   require("persistence").select()
-- end)
--
-- -- load the last session
-- vim.keymap.set("n", "<leader>ql", function()
--   require("persistence").load({ last = true })
-- end)
--
-- -- stop Persistence => session won't be saved on exit
-- vim.keymap.set("n", "<leader>qd", function()
--   require("persistence").stop()
-- end)

-- Terminal
map(
  { "n", "t" },
  "<A-BS>",
  -- "<cmd>lua local dir = vim.fn.expand('%:p:h'); if vim.fn.isdirectory(dir) == 1 then vim.cmd.lcd(dir) end; local term = Snacks.terminal.toggle(nil, {shell = os.getenv('SHELL'), auto_insert = true}); if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then vim.api.nvim_create_autocmd('TermOpen', {buffer = term.buf, callback = function() Snacks.terminal.colorize() end, once = true}) end<CR>",
  "<cmd>lua local dir = vim.fn.expand('%:p:h'); if vim.fn.isdirectory(dir) == 1 then vim.cmd.lcd(dir) end; Snacks.terminal.toggle()<CR>",
  -- "<cmd>lua local dir = vim.fn.expand('%:p:h'); if vim.fn.isdirectory(dir) == 1 then vim.cmd.lcd(dir) end; Snacks.terminal.toggle(nil, os.getenv('SHELL'))<CR>",
  { desc = "terminal" }
)

-- Flash jump
-- map({ "n", "x", "o" }, "f", function()
-- require("flash").jump()
-- end, { desc = "Flash" })

-- Flash treesitter
-- map({ "n", "x", "o" }, "F", function()
-- require("flash").treesitter()
-- end, { desc = "Flash Treesitter" })

-- swap f and s
-- map({ "n", "x", "o" }, "s", "f", { desc = "Search forward" })

-- swap F and S
-- map({ "n", "x", "o" }, "S", "F", { desc = "Search backward" })

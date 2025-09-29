-- Previous/Last Position
map("n", "<D-u>", "<C-o>", { desc = "Go to previous cursor position" })

map("n", "<D-o>", "<C-i>", { desc = "Go to next cursor position" })
-- Down
map({ "n", "x" }, "e", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })

-- Up
map({ "n", "x" }, "a", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Left/Right
map({ "n", "v", "o", "x" }, "h", "h", { desc = "Left", noremap = true })
map({ "n", "v", "o", "x" }, "i", "l", { desc = "Right", noremap = true })

map({ "n", "v", "o", "x" }, "I", "$", { desc = "Start of line", noremap = true })
map({ "n", "v", "o", "x" }, "H", "^", { desc = "End of line", noremap = true })

-- macOS keybindings
map("n", "<A-Left>", "b", { desc = "Move to previous word (⌥←)" })
map("n", "<A-Right>", "e", { desc = "Move to next word (⌥→)" })
map("i", "<A-Left>", "<C-o>b", { desc = "Move to previous word (⌥←)" })
map("i", "<A-Right>", "<C-o>e", { desc = "Move to next word (⌥→)" })
map("v", "<A-Left>", "b", { desc = "Move to previous word (⌥←)" })
map("v", "<A-Right>", "e", { desc = "Move to next word (⌥→)" })
map("n", "<D-Left>", "B", { desc = "Move to previous WORD (⌘←)" })
map("n", "<D-Right>", "E", { desc = "Move to next WORD (⌘→)" })
map("i", "<D-Left>", "<C-o>B", { desc = "Move to previous WORD (⌘←)" })
map("i", "<D-Right>", "<C-o>E", { desc = "Move to next WORD (⌘→)" })
map("v", "<D-Left>", "B", { desc = "Move to previous WORD (⌘←)" })
map("v", "<D-Right>", "E", { desc = "Move to next WORD (⌘→)" })

-- map("i", "<D-l>", "<Home>", { desc = "Go to end of line (insert mode)" })
map("i", "<D-y>", "<End>", { desc = "Go to end of line (insert mode)" })
map("i", "<D-l>", "<C-o>^", { desc = "Go to first non-whitespace character (insert mode)" })

-- Cursor Position Navigation
-- map("n", "<D-M-Left>", "<C-o>", { desc = "Previous cursor position" })
-- map("n", "<D-M-Right>", "<C-i>", { desc = "Next cursor position" })

-- Insert mode cursor movement
map("i", "<C-M-S-h>", "<Left>", { desc = "Left" })
map("i", "<C-M-S-e>", "<Down>", { desc = "Down" })
map("i", "<C-M-S-a>", "<Up>", { desc = "Up" })
map("i", "<C-M-S-i>", "<Right>", { desc = "Right" })

map({ "n", "v", "o", "x" }, "E", "}zz", { desc = "Next paragraph", noremap = true })
map({ "n", "v", "o", "x" }, "A", "{zz", { desc = "Prev paragraph", noremap = true })

-- map({ "n", "v", "o", "x" }, "u", "<C-d>zz", { desc = "Half down", noremap = true })
-- map({ "n", "v", "o", "x" }, "o", "<C-u>zz", { desc = "Half up", noremap = true })

-- map({ "n", "v", "o", "x" }, "U", "<C-d><C-d>zz", { desc = "Full up", noremap = true })
-- map({ "n", "v", "o", "x" }, "O", "<C-u><C-u>zz", { desc = "Full down", noremap = true })

-- By default, CTRL-U and CTRL-D scroll by half a screen (50% of the window height)
-- Scroll by 35% of the window height and keep the cursor centered
local scroll_percentage = 0.35
-- Scroll by a percentage of the window height and keep the cursor centered
vim.keymap.set({ "n", "v" }, "u", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * scroll_percentage)
  vim.cmd("normal! " .. lines .. "jzz")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "o", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * scroll_percentage)
  vim.cmd("normal! " .. lines .. "kzz")
end, { noremap = true, silent = true })

local big_scroll_percentage = 0.7
-- Scroll by a percentage of the window height and keep the cursor centered
vim.keymap.set({ "n", "v" }, "U", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * big_scroll_percentage)
  vim.cmd("normal! " .. lines .. "jzz")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "O", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * big_scroll_percentage)
  vim.cmd("normal! " .. lines .. "kzz")
end, { noremap = true, silent = true })

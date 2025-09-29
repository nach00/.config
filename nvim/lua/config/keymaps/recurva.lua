-- Scroll by 35% of the window height and keep the cursor centered
local small_scroll_percentage = 0.35
-- Scroll by a percentage of the window height and keep the cursor centered
local big_scroll_percentage = 0.7

vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })

-- ── A ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "x" }, "a", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true }) -- moves cursor up 1 line
map({ "n", "v", "o", "x" }, "A", "{zz", { desc = "Prev paragraph", noremap = true }) -- moves cursor up 1 paragraph and recenter

-- ── B ───────────────────────────────────────────────────────────────
-- default

-- ── C ───────────────────────────────────────────────────────────────
-- default

-- ── D ───────────────────────────────────────────────────────────────
-- default

-- ── E ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "x" }, "e", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true }) -- move cursor down 1 line
map({ "n", "v", "o", "x" }, "E", "}zz", { desc = "Next paragraph", noremap = true }) -- move cursor down 1 paragraph and recenter

-- ── F ───────────────────────────────────────────────────────────────
-- default

-- ── G ───────────────────────────────────────────────────────────────
-- default

-- ── H ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v", "o", "x" }, "h", "h", { desc = "Left", noremap = true }) -- move cursor left 1 character
vim.keymap.set({ "n", "v", "o", "x" }, "H", "^", { desc = "Far left", noremap = true }) -- move cursor to start of line (no whitespace)

-- ── I ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v", "o", "x" }, "i", "l", { desc = "Right", noremap = true }) -- move cursor right 1 character
vim.keymap.set({ "n", "v", "o", "x" }, "I", "$", { desc = "Far right", noremap = true }) -- move cursor to end of line

-- ── J ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v", "o", "x" }, "j", "i", { desc = "Insert", noremap = true }) -- enter insert mode
vim.keymap.set({ "n", "v", "o", "x" }, "J", "O", { desc = "Insert above", noremap = true }) -- insert line above cursor and enter insert mode

-- ── K ───────────────────────────────────────────────────────────────
map("n", "k", "<cmd>norm gcc<CR><Down>", { desc = "comment" }) -- comment current line and move cursor down 1 line in normal mode
map("v", "k", "<cmd>norm gcc<CR>gv", { desc = "comment" }) -- comment selected lines

-- ── L ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v", "o", "x" }, "l", "a", { desc = "Append", noremap = true }) -- append before cursor position and enter insert mode
vim.keymap.set({ "n", "v", "o", "x" }, "L", "o", { desc = "Insert below", noremap = true }) -- insert line below cursor and enter insert mode

-- ── M ───────────────────────────────────────────────────────────────
-- default

-- ── N ───────────────────────────────────────────────────────────────
-- default

-- ── O ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "o", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * small_scroll_percentage)
  vim.cmd("normal! " .. lines .. "kzz")
end, { noremap = true, silent = true }) -- scroll up small percentage
vim.keymap.set({ "n", "v" }, "O", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * big_scroll_percentage)
  vim.cmd("normal! " .. lines .. "kzz")
end, { noremap = true, silent = true }) -- scroll up big percentage

-- ── P ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "p", '"+p', { desc = "paste" }) -- paste from clipboard below cursor position
vim.keymap.set({ "n", "v" }, "P", '"+P', { desc = "paste" }) -- paste from clipboard abowe cursor position

-- ── Q ───────────────────────────────────────────────────────────────
map("n", "Q", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- ── R ───────────────────────────────────────────────────────────────
-- default

-- ── S ───────────────────────────────────────────────────────────────

-- ── T ───────────────────────────────────────────────────────────────

-- ── U ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "u", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * small_scroll_percentage)
  vim.cmd("normal! " .. lines .. "jzz")
end, { noremap = true, silent = true }) -- scroll down small percentage
vim.keymap.set({ "n", "v" }, "U", function()
  local lines = math.floor(vim.api.nvim_win_get_height(0) * big_scroll_percentage)
  vim.cmd("normal! " .. lines .. "jzz")
end, { noremap = true, silent = true }) -- scroll down big percentage

-- ── V ───────────────────────────────────────────────────────────────
-- Swap v and V for convenience
vim.keymap.set({ "n" }, "v", "V", { desc = "Visual line mode" }) -- visual line mode
vim.keymap.set({ "n" }, "V", "v", { desc = "Visual" }) -- visual mode

-- ── W ───────────────────────────────────────────────────────────────

-- ── X ───────────────────────────────────────────────────────────────
vim.keymap.set({ "v" }, "x", '"+x', { desc = "cut" }) -- cut selection to clipboard
vim.keymap.set({ "n" }, "X", "Vx", { desc = "cut" }) -- cut current line

-- ── Y ───────────────────────────────────────────────────────────────
vim.keymap.set({ "n" }, "y", 'V"+y', { desc = "copy" }) -- copy current line to clipboard
vim.keymap.set({ "v" }, "y", '"+ygv', { desc = "copy" }) -- copy selection to clipboard

-- ── Z ───────────────────────────────────────────────────────────────
map("n", "z", "<C-x>", { desc = "Decrement Integer" }) -- reduce next interger by 1
map("n", "Z", "<C-a>", { desc = "Increment Integer" }) -- increase next interger by 1

-- ── Custom navigation ───────────────────────────────────────────────
vim.keymap.set("i", "<D-y>", "<End>", { desc = "Go to end of line (insert mode)" })
vim.keymap.set("i", "<D-l>", "<C-o>^", { desc = "Go to first non-whitespace character (insert mode)" })

vim.keymap.set("n", "<D-u>", "<C-o>", { desc = "Go to previous cursor position" })
vim.keymap.set("n", "<D-o>", "<C-i>", { desc = "Go to next cursor position" })

-- vim.keymap.set("i", "<C-M-S-h>", "<Left>", { desc = "Left" })
-- vim.keymap.set("i", "<C-M-S-e>", "<Down>", { desc = "Down" })
-- vim.keymap.set("i", "<C-M-S-a>", "<Up>", { desc = "Up" })
-- vim.keymap.set("i", "<C-M-S-i>", "<Right>", { desc = "Right" })

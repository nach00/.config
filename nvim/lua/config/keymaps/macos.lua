-- Undo/Redo
vim.keymap.set({ "n", "v", "i" }, "<D-z>", "<cmd>undo<CR>", { desc = "Undo", noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<D-S-z>", "<cmd>redo<CR>", { desc = "Redo", noremap = true })

-- save file
vim.keymap.set({ "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.keymap.set({ "i" }, "<D-s>", "<Esc><cmd>w<CR>i<Right>", { desc = "Save file (⌘S)" })

-- cursor navigation
vim.keymap.set("n", "<A-Left>", "b", { desc = "Move to previous word (⌥←)" })
vim.keymap.set("i", "<A-Left>", "<C-o>b", { desc = "Move to previous word (⌥←)" })
vim.keymap.set("v", "<A-Left>", "b", { desc = "Move to previous word (⌥←)" })

vim.keymap.set("n", "<A-Right>", "e", { desc = "Move to next word (⌥→)" })
vim.keymap.set("i", "<A-Right>", "<C-o>e", { desc = "Move to next word (⌥→)" })
vim.keymap.set("v", "<A-Right>", "e", { desc = "Move to next word (⌥→)" })

vim.keymap.set("n", "<D-Left>", "B", { desc = "Move to previous WORD (⌘←)" })
vim.keymap.set("i", "<D-Left>", "<C-o>B", { desc = "Move to previous WORD (⌘←)" })
vim.keymap.set("v", "<D-Left>", "B", { desc = "Move to previous WORD (⌘←)" })

vim.keymap.set("n", "<D-Right>", "E", { desc = "Move to next WORD (⌘→)" })
vim.keymap.set("i", "<D-Right>", "<C-o>E", { desc = "Move to next WORD (⌘→)" })
vim.keymap.set("v", "<D-Right>", "E", { desc = "Move to next WORD (⌘→)" })

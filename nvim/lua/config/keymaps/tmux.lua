-- undo/redo
-- map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>", { desc = "Undo (⌘Z)" })
-- map({ "n", "v", "i" }, "<M-z>", "<cmd>redo<CR>", { desc = "Redo (⌘⇧Z})" })

-- save file
-- map({ "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- map({ "i" }, "<C-s>", "<Esc><cmd>w<CR>i<Right>", { desc = "Save file (⌘S)" })

-- Save file while preserving cursor position
-- vim.keymap.set("n", ":w<CR>", function()
--   local cursor_pos = vim.fn.getcurpos()
--   vim.cmd("write")
--   vim.fn.setpos(".", cursor_pos)
-- end, { noremap = true, silent = true })

-- If you use Ctrl+S for saving
-- vim.keymap.set("n", "<C-s>", function()
--   local cursor_pos = vim.fn.getcurpos()
--   vim.cmd("write")
--   vim.fn.setpos(".", cursor_pos)
-- end, { noremap = true, silent = true })

-- For insert mode Ctrl+S
-- vim.keymap.set("i", "<C-s>", function()
--   local cursor_pos = vim.fn.getcurpos()
--   vim.cmd("write")
--   vim.fn.setpos(".", cursor_pos)
--   -- Return to insert mode if needed
--   vim.cmd("startinsert")
-- end, { noremap = true, silent = true })

-- Duplication
-- map("n", "<C-d>", "VYP<Down>", { desc = "Duplicate line" })
-- map("i", "<C-d>", "<Esc>VYP<Down>i", { desc = "Duplicate line" })
-- map("v", "<C-d>", "YPgv", { desc = "Duplicate block" })

-- map("n", "<A-1>", "<cmd>Telescope frecency<CR>", { desc = "frecency" })
-- map("n", "<A-2>", "<cmd>Telescope smart_open<CR>", { desc = "smart open" })

-- Select all
-- map("n", "<A-3>", "ggVG", { desc = "Select all (⌘A)" })
-- map("i", "<A-3>", "<Esc>ggVG", { desc = "Select all (⌘A)" })

-- Copy
-- map({ "n" }, "<A-4>", 'V"+y', { desc = "copy" })
-- map({ "v" }, "<A-4>", '"+y', { desc = "copy" })

-- Cut
-- map({ "n", "v" }, "<A-5>", '"+x', { desc = "cut" })

-- Paste
-- map({ "n", "v" }, "<A-6>", '"+p', { desc = "paste" })
-- map({ "n", "v" }, "<A-6>", "p", { desc = "paste" })

-- map("n", "<leader>h", "", { desc = "custom quick edit" })
--
-- map("n", "<leader>ha", "", { desc = "append" })
-- map("n", "<leader>ha`", "vi`A", { desc = "append ``" }) --
-- map("n", "<leader>ha'", "vi'A", { desc = "append ''" }) --
-- map("n", '<leader>ha"', 'vi"A', { desc = 'append ""' }) --
-- map("n", "<leader>ha(", "vi(A", { desc = "append ()" }) --
-- map("n", "<leader>ha[", "vi[A", { desc = "append []" }) --
-- map("n", "<leader>ha{", "vi{A", { desc = "append {}" }) --
-- map("n", "<leader>ha<", "vi<A", { desc = "append <>" }) --
--
-- map("n", "<leader>hl", "", { desc = "append last" })
-- map("n", "<leader>hl`", "$F`i", { desc = "append last ``" })
-- map("n", "<leader>hl'", "$F'i", { desc = "append last ''" })
-- map("n", '<leader>hl"', '$F"i', { desc = 'append last ""' })
-- map("n", "<leader>hl(", "$F)i", { desc = "append last ()" })
-- map("n", "<leader>hl[", "$F>i", { desc = "append last []" })
-- map("n", "<leader>hl{", "$F}i", { desc = "append last {}" })
-- map("n", "<leader>hl<", "$F>i", { desc = "append last <>" })
--
-- map("n", "<leader>hc", "", { desc = "change" })
-- map("n", "<leader>hcw", "ciw", { desc = "change word" })
-- map("n", "<leader>hct", "cit", { desc = "change in tag" })
-- map("n", "<leader>hc`", "ci`", { desc = "change in ``" })
-- map("n", "<leader>hc'", "ci'", { desc = "change in ''" })
-- map("n", '<leader>hc"', 'ci"', { desc = 'change in ""' })
-- map("n", "<leader>hc(", "ci(", { desc = "change in ()" })
-- map("n", "<leader>hc[", "ci[", { desc = "change in []" })
-- map("n", "<leader>hc{", "ci{", { desc = "change in {}" })
-- map("n", "<leader>hc<", "ci<", { desc = "change in <>" })
--
-- map("n", "<leader>hi", "", { desc = "select inside" })
-- map("n", "<leader>hiw", "viw", { desc = "select word" }) --
-- map("n", "<leader>hit", "vit", { desc = "select in tag" })
-- map("n", "<leader>hif", "V$%", { desc = "select function" }) --
-- map("n", "<leader>hi`", "vi`", { desc = "select in ``" })
-- map("n", "<leader>hi'", "vi'", { desc = "select in ''" })
-- map("n", '<leader>hi"', 'vi"', { desc = 'select in ""' })
-- map("n", "<leader>hi(", "vi(", { desc = "select in ()" })
-- map("n", "<leader>hi[", "vi[", { desc = "select in []" })
-- map("n", "<leader>hi{", "vi{", { desc = "select in {}" })
-- map("n", "<leader>hi<", "vi<", { desc = "select in <>" })
--
-- map("n", "<leader>ho", "", { desc = "select around" })
-- map("n", "<leader>hot", "vat", { desc = "select around tag" })
-- map("n", "<leader>ho`", "va`", { desc = "select around ``" })
-- map("n", "<leader>ho'", "va'", { desc = "select around ''" })
-- map("n", '<leader>ho"', 'va"', { desc = 'select around ""' })
-- map("n", "<leader>ho(", "va(", { desc = "select around ()" })
-- map("n", "<leader>ho[", "va[", { desc = "select around []" })
-- map("n", "<leader>ho{", "va{", { desc = "select around {}" })
-- map("n", "<leader>ho<", "va<", { desc = "select around <>" })

-- Disable
-- map("n", "<D-Left>", "<Nop>", { desc = "Disable Cmd+Left" })
-- map("n", "<D-Right>", "<Nop>", { desc = "Disable Cmd+Right" })

map("n", "|", "<cmd>q!<CR>", { desc = "Quit" })
map("n", "rr", "<cmd>cq<CR>", { desc = "Reload" })

-- Selection and Clipboard Operations
-- map("n", "<D-a>", "ggVG", { desc = "Select all (⌘A)", noremap = true })
-- map("i", "<D-a>", "<Esc>ggVG", { desc = "Select all (⌘A)" })
-- map("n", "<D-a>", "gg<S-v>G")

map("n", "<A-3>", "ggVG", { desc = "Select all (⌘A)" })
map("i", "<A-3>", "<Esc>ggVG", { desc = "Select all (⌘A)" })

-- map("n", "<A-1>", "<cmd>Telescope frecency<CR>", { desc = "frecency" })
-- map("n", "<A-2>", "<cmd>Telescope smart_open<CR>", { desc = "smart open" })

-- Move Lines
-- map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
map("n", "<A-e>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-a>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<A-e>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-a>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- map("n", "<A-u>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- map("n", "<A-o>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- map("v", "<A-u>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-o>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- map("i", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- map("i", "<A-a>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

-- Duplication
map("n", "<D-d>", "VYP<Down>", { desc = "Duplicate line" })
map("i", "<D-d>", "<Esc>VYP<Down>i", { desc = "Duplicate line" })
map("v", "<D-d>", "YPgv", { desc = "Duplicate block" })

-- Delete operations
map("n", "<Del>", '<Right>"_x<Left>', { desc = "Delete next character" })
map("i", "<Del>", "<Right><BS>", { desc = "Delete next character" })
map("v", "<Del>", '"_d', { desc = "Delete selection" })

-- Delete key
map("i", "<M-BS>", "<C-w>", { desc = "Delete WORD backward" })
map("n", "<M-BS>", "db", { desc = "Delete WORD backward" })

-- Shift-enter
map("n", "<S-CR>", "o<CR><space><CR><Esc><Up>^", { desc = "insert 3 lines below" })
map("i", "<S-CR>", "<CR><CR><Up><BS><CR>", { desc = "insert 3 lines below" })

-- Cmd-Alt-enter
map("n", "<D-A-CR>", "O<CR><space><CR><Esc><Up>^", { desc = "insert 3 lines above" })
map("i", "<D-A-CR>", "<Esc>O<CR><space><CR><Esc><Up>^i<Del>", { desc = "insert 3 lines above" })

-- Cmd-backspace
map("i", "<C-u>", "<Esc>ddi", { desc = "Delete Line (⌘Backspace)" })

-- Fold
map("n", "<C-BS>", "za", { desc = "Toggle fold/unfold" })

map("n", "?", "~", { desc = "toggle case" })

-- Clear highlights and other
-- map("n", "<C-BS>", ":nohl<CR>", { desc = "clear search highlighting" })

map("v", "<", "<gv", { desc = "shift left" })
map("v", ">", ">gv", { desc = "shift right" })

-- Copy/Cut/Paste
map({ "n" }, "<D-c>", 'V"+y', { desc = "copy" })
map({ "v" }, "<D-c>", '"+y', { desc = "copy" })
map({ "n", "v" }, "<D-x>", '"+x', { desc = "cut" })
map({ "n", "v" }, "<D-v>", '"+p', { desc = "paste" })

-- Comment
map({ "n", "v" }, "<leader>k", "<cmd><CR>", { desc = "+comment" })
map({ "n", "v" }, "<leader>kk", "<cmd>CBllline<CR>", { desc = "comment line" })
map({ "n", "v" }, "<leader>kb", "<cmd>CBccbox<CR>", { desc = "box" })
map({ "n", "v" }, "<leader>kl", "<cmd>CBline<CR>", { desc = "solid line" })
map({ "n", "v" }, "<leader>km", "<cmd>CBllbox14<CR>", { desc = "marked" })
map({ "n", "v" }, "<leader>kt", "<cmd>CBd<CR>", { desc = "remove box" })

-- Replace
map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace" })

-- Insert file name
map("n", "<leader>I", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  local lineToInsert = filePath
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current row number
  -- Insert line, leave cursor current position
  vim.api.nvim_buf_set_lines(0, row - 1, row - 0, false, { lineToInsert })
  -- Comment out the newly inserted line using the plugin's 'gcc' command
  vim.cmd("normal gcc")
  -- Insert a blank line below the current line
  vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
end, { desc = "insert file name" })

-- Copy filepath to clipboard
map("n", "<leader>F", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  vim.notify("File path copied to clipboard: " .. filePath, vim.log.levels.INFO)
end, { desc = "copy filepath to clipboard" })

-- Tab to indent
-- map("v", "<Tab>", ">gv", { desc = "indent" })
-- map("v", "<S-Tab>", "<gv", { desc = "unindent" })

-- map("n", "<CR>", "ggVG", { desc = "yank all" })

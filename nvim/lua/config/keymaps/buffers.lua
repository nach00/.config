-- buffers
map({ "n", "v" }, "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map({ "n", "v" }, "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map({ "n" }, "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map({ "n" }, "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- map("n", "<D-S-t>", "<cmd>lua _G.reopen_last_buffer()<CR>", { desc = "Reopen buffer" })

-- Window split keymaps
-- map("n", "<D-S-t>", function()
--   if #_G.closed_buffers > 0 then
--     local file_path = table.remove(_G.closed_buffers, 1)
--     vim.cmd("edit " .. vim.fn.fnameescape(file_path))
--     vim.notify("Reopened: " .. file_path, vim.log.levels.INFO)
--   else
--     vim.notify("No closed buffers to reopen", vim.log.levels.INFO)
--   end
-- end, { desc = "Reopen buffer" })

-- Buffer Management
-- map("n", "<leader>b", "<cmd><CR>", { desc = "buffers" })
-- map("n", "<leader>bv", "<C-w>v", { desc = "split vertical" })
-- map("n", "<leader>bx", "<C-w>s", { desc = "split horizontal" })
-- map("n", "<leader>bq", "<C-w>=", { desc = "equalize splits" })
-- map("n", "<leader>bx", "<cmd>close<CR>", { desc = "close split" })
-- map("n", "<leader>bn", "<cmd>tabnew<CR>", { desc = "new tab" })
-- map("n", "<leader>bw", "<cmd>tabclose<CR>", { desc = "close tab" })
-- map("n", "<leader>bf", "<cmd>tabnew %<CR>", { desc = "new tab (current)" })

-- Move to window using the <ctrl> heai keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-e>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-a>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-i>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Window focus keymaps
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "focus left" })
-- map("n", "<C-e>", "<C-w><C-j>", { desc = "focus down" })
-- map("n", "<C-a>", "<C-w><C-k>", { desc = "focus up" })
-- map("n", "<C-i>", "<C-w><C-l>", { desc = "focus right" })

-- CA+HEAI
-- Focus nvim
map("n", "<C-A-h>", "<C-w><C-h>", { desc = "focus left" })
map("n", "<C-A-e>", "<C-w><C-j>", { desc = "focus down" })
map("n", "<C-A-a>", "<C-w><C-k>", { desc = "focus up" })
map("n", "<C-A-i>", "<C-w><C-l>", { desc = "focus right" })

-- CA+Arrows
-- Window resize keymaps
map("n", "<C-A-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-A-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-A-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-A-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- CAS+HEAI
-- Window split keymaps
map("n", "<C-S-A-h>", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd h")
end, { desc = "split left" })

map("n", "<C-S-A-e>", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
end, { desc = "split down" })

map("n", "<C-S-A-a>", function()
  vim.cmd("split")
  vim.cmd("wincmd k")
end, { desc = "split up" })

map("n", "<C-S-A-i>", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end, { desc = "split right" })

-- CAS+Arrows - NONE

-- Store recently closed buffers
-- _G.closed_buffers = {}

-- Function to store closed buffer paths
-- vim.api.nvim_create_autocmd("BufDelete", {
--   callback = function(args)
--     local file_path = vim.api.nvim_buf_get_name(args.buf)
--     -- Only store if it's a real file
--     if vim.fn.filereadable(file_path) == 1 then
--       table.insert(_G.closed_buffers, 1, file_path)
--       -- Keep only last 10 closed buffers
--       if #_G.closed_buffers > 10 then
--         table.remove(_G.closed_buffers)
--       end
--     end
--   end,
-- })

-- Function to reopen last closed buffer
-- function _G.reopen_last_buffer()
--   if #_G.closed_buffers > 0 then
--     local file_path = table.remove(_G.closed_buffers, 1)
--     vim.cmd("edit " .. vim.fn.fnameescape(file_path))
--     vim.notify("Reopened: " .. file_path, vim.log.levels.INFO)
--   else
--     vim.notify("No closed buffers to reopen", vim.log.levels.INFO)
--   end
-- end

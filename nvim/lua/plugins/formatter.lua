-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,

      filetype = {
        ruby = {
          require("formatter.filetypes.ruby").rubocop,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Auto format on save",
      group = vim.api.nvim_create_augroup("_local_auto_format", { clear = true }),
      pattern = "*",
      command = ":FormatWrite",
    })
  end,
}

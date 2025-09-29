return { -- Collection of various small independent plugins/modules
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.align").setup({})
  end,
}

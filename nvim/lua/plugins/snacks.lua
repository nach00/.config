return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = false },
      scroll = {
        enabled = false,
        animate = {
          duration = { step = 15, total = 250 },
          easing = "linear",
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = "linear",
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },

      terminal = {
        win = {
          keys = {
            nav_h = { "<C-H>", vim.cmd.wincmd("h"), desc = "Go to Left Window", expr = true, mode = "t" },
            nav_j = { "<C-E>", vim.cmd.wincmd("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
            nav_k = { "<C-A>", vim.cmd.wincmd("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
            nav_l = { "<C-I>", vim.cmd.wincmd("l"), desc = "Go to Right Window", expr = true, mode = "t" },
          },
        },
      },
    },
  },
}

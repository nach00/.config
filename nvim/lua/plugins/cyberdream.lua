-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "auto",
      saturation = 1,
      transparent = true,
      italic_comments = true,
      hide_fillchars = false,
      terminal_colors = true,
      cache = true,
      borderless_pickers = false,
      -- highlights = {
      --   Comment = { fg = "#696969", bg = "NONE", italic = true },
      -- },

      overrides = function(c)
        return {
          -- CursorLine = { bg = c.bg },
          CursorLineNr = { fg = c.magenta },
          -- Comment = { fg = c.green, bg = "NONE", italic = true },
          -- ["@property"] = { fg = c.magenta, bold = true },
          -- ["@comment"] = { italic = true },
          -- ["@variable.used"] = { bold = true },
        }
      end,
      -- colors = {
      --   bg = "#16181a",
      --   bg_alt = "#1e2124",
      --   bg_highlight = "#3c4048",
      --   fg = "#ffffff",
      --   grey = "#7b8496",
      --
      --   blue = "#00b8ff",
      --   -- blue = "#495495",
      --   green = "#72F1B8",
      --   cyan = "#61E2FF",
      --   red = "#FE4450",
      --   yellow = "#ffcc00",
      --   magenta = "#ff1690",
      --   pink = "#FF7EDB",
      --   orange = "#FF8B39",
      --   purple = "#9933ff",
      --   -- purple = "#AF6DF9",
      --   -- ----------------
      --   -- blue = "#00b8ff",
      --   -- green = "#00ff44",
      --   -- cyan = "#00ffff",
      --   -- red = "#ff3333",
      --   -- yellow = "#ffff00",
      --   -- magenta = "#ff00ff",
      --   -- pink = "#ff1493",
      --   -- orange = "#ff8c00",
      --   -- purple = "#9933ff",
      --   -- blue = "#0066ff",
      --   -- green = "#00cc00",
      --   -- cyan = "#00e0ff",
      --   -- red = "#ff0000",
      --   -- yellow = "#ffd700",
      --   -- magenta = "#ff00ff",
      --   -- pink = "#ff0080",
      --   -- orange = "#ff8000",
      --   -- purple = "#8000ff",
      --   -- bg = "#0d0e11", -- Darker background for that deep cyberpunk noir feel
      --   -- bg_alt = "#151821", -- Slightly lighter alt background
      --   -- bg_highlight = "#2a2d3d", -- Subtle highlight that doesn't distract from neon accents
      --   -- fg = "#e0e0ff", -- Slightly blue-tinted foreground for that digital feel
      --   -- grey = "#566c7d", -- Muted industrial grey
      --   -- blue = "#00ccff", -- Electric blue, brighter and more vibrant
      --   -- green = "#00ff9d", -- Toxic/acid green with a bit more teal
      --   -- cyan = "#50e3ff", -- Bright holographic cyan
      --   -- red = "#ff2253", -- Hot neon red with pink undertones
      --   -- yellow = "#ffdf00", -- More gold-tinted yellow for contrast
      --   -- magenta = "#ff1690", -- Hot magenta that pops against dark backgrounds
      --   -- pink = "#ff00c8", -- Vibrant electric pink
      --   -- orange = "#ff5a00", -- Brighter, more neon orange
      --   -- purple = "#bf00ff", -- Electric purple, more saturated
      --   -- palette = 0=#241B2F
      --   -- # palette = 0=#16181a
      --   -- palette = 1=#AF6DF9
      --   -- palette = 2=#72F1B8
      --   -- palette = 3=#FFCC00
      --   -- palette = 4=#FE4450
      --   -- palette = 5=#FF7EDB
      --   -- palette = 6=#61E2FF
      --   -- palette = 7=#F8F8F8
      --   -- palette = 8=#495495
      --   -- palette = 9=#bf8afa
      --   -- palette = 10=#39795c
      --   -- palette = 11=#ffd633
      --   -- palette = 12=#fe6973
      --   -- palette = 13=#ff98e2
      --   -- palette = 14=#81e8ff
      --   -- palette = 15=#ffffff
      -- },
      extensions = {
        alpha = true,
        base = true,
        blinkcmp = true,
        cmp = true,
        dashboard = true,
        fzflua = true,
        gitpad = true,
        gitsigns = true,
        grapple = true,
        grugfar = true,
        heirline = true,
        helpview = true,
        hop = true,
        indentblankline = true,
        kubectl = true,
        lazy = true,
        leap = true,
        markdown = true,
        markview = true,
        mini = true,
        neogit = true,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesittercontext = true,
        trouble = true,
        whichkey = true,
      },
    })

    vim.cmd("colorscheme cyberdream")
  end,
}

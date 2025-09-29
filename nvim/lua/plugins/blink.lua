-- if true then
-- return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "saghen/blink.cmp",
  -- enabled = function()
  --   return not vim.tbl_contains({ "html" }, vim.bo.filetype)
  --     and vim.bo.buftype ~= "prompt"
  --     and vim.b.completion ~= false
  -- end,
  opts = {
    -- snippets = {
    --   preset = "luasnip",
    -- },
    completion = {
      menu = {
        --   border = "double",
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      ghost_text = {
        enabled = false,
        -- enabled = vim.g.ai_cmp,
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    -- sources = {
    --   default = { "lsp", "path", "snippets", "buffer", "html-css" },
    --   providers = {
    --     ["html-css"] = {
    --       name = "html-css",
    --       module = "blink.compat.source",
    --     },
    --   },
    -- },

    -- experimental signature help support
    signature = { enabled = true },

    keymap = {
      -- preset = "enter",
      ["<C-a>"] = { "select_prev", "fallback" },
      ["<C-e>"] = { "select_next", "fallback" },
      ["<C-S-a>"] = { "scroll_documentation_up", "fallback" },
      ["<C-S-e>"] = { "scroll_documentation_down", "fallback" },
      ["<C-i>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-CR>"] = { "select_and_accept" },
      ["<C-BS>"] = { "hide", "fallback" },

      -- disable a keymap from the preset
      ["<Left>"] = {},
      ["<Down>"] = {},
      ["<Up>"] = {},
      ["<Right>"] = {},
      ["<CR>"] = {},

      -- ["<C-space>"] = {
      --   function(cmp)
      --     cmp.show({ providers = { "snippets" } })
      --   end,
      -- },
    },
  },
}
-- opts_extend = { "sources.default" },

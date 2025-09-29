return {
  "stevearc/oil.nvim",
  -- All your configuration goes into the 'opts' table.
  -- lazy.nvim will automatically call require("oil").setup(opts)
  opts = {
    -- You can remove this, as it's the default.
    -- I'm leaving it here for clarity.
    lsp_file_methods = {
      enabled = true,
      -- Optional: give the LSP more time to respond
      timeout_ms = 2000,
      -- Optional: automatically save the changed files
      autosave_changes = true,
    },
    float = {
      preview_split = "below",
    },
    -- NOTE: The column is "icon", not "icons"
    columns = { "icon" },
    keymaps = {
      -- This keymap makes sense if you want "-" to close oil instead of going to the parent
      ["-"] = "actions.close",
      ["<Esc>"] = "actions.close",
      -- This is fine, it unmaps the default vertical split select
      ["<C-s>"] = false,
      -- Using backspace to go to the parent directory is a great idea
      ["<BS>"] = { "actions.parent", mode = "n" },
    },
    view_options = {
      show_hidden = true,
    },
    preview_win = {
      update_on_cursor_moved = true,
    },
  },
  -- Dependencies are correct
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- Lazy loading is not recommended for oil.nvim, so this is correct.
  lazy = false,
}

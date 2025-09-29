return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  -- Lazy.nvim key mappings
  -- keys = {
  --   { "<C-n>", desc = "Start Visual Multi" },
  --   { "N", desc = "VM Previous" },
  --   { "n", desc = "VM Next" },
  --   { "<C-a>", desc = "VM Add Cursor Up" },
  --   { "<C-e>", desc = "VM Add Cursor Down" },
  --   { "<C-h>", desc = "VM Select Left" },
  --   { "<C-i>", desc = "VM Select Right" },
  --   { "q", desc = "VM Skip Current" },
  --   { "Q", desc = "VM Remove Current" },
  --   { "==/", desc = "VM Start Regex Search" },
  --   { "==`", desc = "VM Tools Menu" },
  --   { "==a", desc = "VM Align" },
  --   { "==t", desc = "VM Transpose" },
  --   { "M", desc = "VM Toggle Multiline" },
  -- },
  init = function()
    vim.g.VM_default_mappings = 0

    vim.g.VM_maps = {
      -- Insert Mode (Recurva)
      ["i"] = "j", -- Enter insert mode before cursor (remapped for Recurva)
      ["I"] = "J", -- Enter insert mode at start of line (remapped for Recurva)
      ["a"] = "l", -- Enter insert mode after cursor (remapped for Recurva)
      ["A"] = "L", -- Enter insert mode at end of line (remapped for Recurva)
      ["o"] = "U", -- Open line below and enter insert mode
      ["O"] = "O", -- Open line above and enter insert mode

      -- Basic Navigation
      ["Motion h"] = "h", -- Move left
      ["Motion j"] = "e", -- Move down
      ["Motion k"] = "a", -- Move up
      ["Motion l"] = "i", -- Move right

      ["Add Cursor Down"] = "<C-e>",
      ["Add Cursor Up"] = "<C-a>",

      -- Disable Cmd+Left and Cmd+Right (macOS)
      -- ["Add Cursor Left"] = "",
      -- ["Add Cursor Right"] = "",
      -- ["Select Left"] = "",
      -- ["Select Right"] = "",
      -- ["D-Left"] = "<Nop>",
      -- ["D-Right"] = "<Nop>",
      -- ["D-Left"] = "",
      -- ["D-Right"] = "",
      -- ["Add Cursor Left"] = "<Nop>",
      -- ["Add Cursor Right"] = "<Nop>",

      ["I Return"] = "<CR>", -- Insert new line
      ["I Left Arrow"] = "<Left>",
      ["I Right Arrow"] = "<Right>",
      ["I Up Arrow"] = "<Up>",
      ["I Down Arrow"] = "<Down>",
      ["I Home"] = "<Home>",
      ["I End"] = "<End>",
      ["I CtrlU"] = "<C-u>", -- Delete to start of line
      ["I CtrlW"] = "<C-w>", -- Delete word backward
      ["I CtrlD"] = "<C-d>", -- Delete forward
      ["I Del"] = "<Del>", -- Delete
      ["I CtrlE"] = "<C-i>", -- Go to end of line
      ["I CtrlA"] = "<C-h>", -- Go to start of line
      ["I CtrlO"] = "<C-o>", -- Execute one normal mode command
      ["I CtrlC"] = "<C-c>", -- Exit insert mode
      ["I Replace"] = "<Insert>", -- Toggle replace mode
      ["I BS"] = "<BS>", -- Backspace

      -- Exit Keys
      ["Exit"] = "<Esc>", -- Exit VM mode completely
      ["Quit VM"] = "q", -- Alternative exit

      -- Essential VM triggers
      ["Find Under"] = "<C-n>", -- Find word under cursor (starts VM)

      -- Mouse Operations
      ["Mouse Cursor"] = "<C-LeftMouse>",
      ["Mouse Word"] = "<C-RightMouse>",
      ["Mouse Column"] = "<C-MiddleMouse>",

      ["Goto Next"] = "n", -- Go to next selected region
      ["Goto Prev"] = "N", -- Go to previous selected region
      ["Toggle Case"] = "?", -- Add this line for toggle case
    }

    -- Set single mode options
    vim.g.VM_single_mode_maps = 1 -- Enable single mode mappings
    vim.g.VM_single_mode_auto_reset = 1 -- Auto reset single mode after insert

    -- Other relevant settings
    vim.g.VM_quit_after_leaving_insert_mode = 0 -- Don't quit after insert mode
    vim.g.VM_mouse_mappings = 1 -- Enable mouse support for mode changes
    vim.g.VM_case_setting = "smart" -- Default case sensitivity

    -- Plugin settings
    vim.g.VM_highlight_matches = "red"
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_show_warnings = 1
    vim.g.VM_case_setting = "smart"
    vim.g.VM_silent_exit = 0

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_command("highlight VM_Cursor gui=bold guifg=#111111 guibg=#FF8B39")
        vim.api.nvim_command("highlight VM_Extend gui=bold guifg=#111111 guibg=#61E2FF")
        vim.api.nvim_command("highlight VM_Insert gui=bold guifg=#FFCC00")
        vim.api.nvim_command("highlight VM_Mono gui=bold guifg=#111111 guibg=#FC199A")
      end,
    })
  end,
}

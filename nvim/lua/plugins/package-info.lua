-- To install, create a new file: lua/plugins/npm-tools.lua
-- and paste the following code into it.
-- Restart Neovim, and lazy.nvim will automatically install the plugin.

return {
  "vuki656/package-info.nvim",
  -- This plugin depends on plenary.nvim, a common utility library.
  -- LazyVim likely already has this, but it's good practice to list it.
  dependencies = { "nvim-lua/plenary.nvim" },
  -- Load the plugin only when you open a package.json file or run a command.
  event = "VeryLazy",
  config = function()
    -- Setup the plugin. The default configuration is excellent,
    -- so we don't need to pass any options here.
    require("package-info").setup()

    -- --- Keymaps for Easy Access ---
    -- We'll create some handy keymaps to interact with your package.json
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Keymap to open the main package info window.
    -- From here, you can see all dependencies and scripts.
    -- It's like a dashboard for your package.json.
    -- I'm using <leader>pn for "Package Npm"
    map("n", "<leader>pn", "<cmd>PackageInfo<cr>", { desc = "NPM: Show Package Info" })

    -- You can also use more specific commands if you prefer.
    -- For example, to only show the scripts:
    -- map("n", "<leader>ps", "<cmd>PackageInfoScripts<cr>", { desc = "NPM: Show Scripts" })

    -- --- Interacting with the Popup ---
    -- Once the PackageInfo window is open, you can use these keys:
    --
    --    `i`        - Installs the package under the cursor.
    --    `I`        - Runs `npm install` for the whole project.
    --    `r`        - Runs the script under the cursor.
    --    `d`        - Deletes the dependency under the cursor.
    --    `v`        - Views the documentation for the package online.
    --    `q`        - Closes the popup window.
    --    `<C-c>`    - Kills a running script process.
  end,
}

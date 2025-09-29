return {
  "rmagatti/alternate-toggler",
  config = function()
    require("alternate-toggler").setup({
      alternates = {
        ["=="] = "!=",
        ["==="] = "!==",
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["on"] = "off",
        ["On"] = "Off",
      },
    })

    vim.keymap.set(
      "n",
      "<leader><leader>",
      "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
      { desc = "Toggle Alternate" }
    )
  end,
  event = { "BufReadPost" }, -- lazy load after reading a buffer
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          mason = false,
          enabled = false,
        },
      },
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },

    config = function()
      require("telescope").setup({
        -- defaults = {
        --   winblend = 100,
        -- },
        pickers = {
          find_files = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      require("config.telescope.multigrep").setup()
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  -- {
  --   "piersolenski/telescope-import.nvim",
  --   dependencies = "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require("telescope").load_extension("import")
  --     require("telescope").setup({
  --       extensions = {
  --         import = {
  --           -- Imports can be added at a specified line whilst keeping the cursor in place
  --           insert_at_top = true,
  --           -- Optionally support additional languages or modify existing languages...
  --           custom_languages = {
  --             {
  --               -- The filetypes that ripgrep supports (find these via `rg --type-list`)
  --               extensions = { "js", "ts" },
  --               -- The Vim filetypes
  --               filetypes = { "vue" },
  --               -- Optionally set a line other than 1
  --               insert_at_line = 2,
  --               -- The regex pattern for the import statement
  --               regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
  --             },
  --           },
  --         },
  --       },
  --     })
  --
  --     vim.keymap.set("n", "<leader>tl", "<cmd>Telescope import<CR>", { desc = "telescope import" })
  --   end,
  -- },
  {
    "nvim-telescope/telescope-fzy-native.nvim",

    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
    config = function()
      require("telescope").load_extension("fzy_native")
    end,
  },

  {
    "octarect/telescope-menu.nvim",
    opts = {
      extensions = {
        menu = {
          default = {
            items = {
              -- You can add an item of menu in the form of { "<display>", "<command>" }
              { "Checkhealth", "checkhealth" },
              { "Show LSP Info", "LspInfo" },
              { "Files", "Telescope find_files" },

              -- The above examples are syntax-sugars of the following;
              { display = "Change colorscheme", value = "Telescope colorscheme" },
            },
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("menu")
    end,
  },

  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf", "webm", "svg", "gif" },
        -- find command (defaults to `fd`)
        find_cmd = "rg",
      },
    },

    config = function()
      require("telescope").load_extension("media_files")
    end,
  },

  {
    "LinArcX/telescope-ports.nvim",
    config = function()
      require("telescope").load_extension("ports")
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-telescope/telescope-symbols.nvim",
    -- config = function()
    --   require("telescope").load_extension("symbols")
    -- end,
  },

  {
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    config = function()
      require("telescope").load_extension("lsp_handlers")
    end,
  },

  {
    "jonarrien/telescope-cmdline.nvim",
    config = function()
      require("telescope").load_extension("cmdline")
    end,
  },

  {
    "ghassan0/telescope-glyph.nvim",
    config = function()
      require("telescope").load_extension("glyph")
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          frecency = {
            db_safe_mode = false,
          },
        },
      })
      require("telescope").load_extension("frecency")
    end,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "olacin/telescope-gitmoji.nvim",
    config = function()
      require("telescope").load_extension("gitmoji")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "danielvolchek/tailiscope.nvim",
    config = function()
      require("telescope").load_extension("tailiscope")
    end,
  },

  {
    "piersolenski/telescope-import.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("import")
    end,
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    opts = {
      -- don't use `defaults = { }` here, do this in the main telescope spec
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        -- no other extensions here, they can have their own spec too
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
}

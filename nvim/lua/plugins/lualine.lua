-- if true then
-- return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local function buf_get_active_clients_str()
      local active_clients = vim.lsp.get_clients({
        bufnr = vim.api.nvim_get_current_buf(),
      })
      local client_names = {}

      for _, client in pairs(active_clients or {}) do
        table.insert(client_names, client.name)
      end

      if not vim.tbl_isempty(client_names) then
        table.sort(client_names)
      end

      if #client_names < 1 then
        return
      end

      local function truncate_name(name)
        if #name <= 6 then
          return name
        end
        return name:sub(1, 3) .. "…" .. name:sub(-2)
      end

      local client_str = ""
      local full_names = {}
      local truncated_names = {}

      -- First build both full and truncated versions
      for i, client_name in ipairs(client_names) do
        table.insert(full_names, client_name)
        table.insert(truncated_names, truncate_name(client_name))
        if i < #client_names then
          table.insert(full_names, ", ")
          table.insert(truncated_names, ", ")
        end
      end

      -- Check if we need to use truncated version
      local full_str = table.concat(full_names)
      if #full_str <= 400 then -- originally 40
        return full_str
      else
        return table.concat(truncated_names)
      end
    end

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    -- Visual-Multi related configurations
    local function setup_visual_multi()
      vim.g.VM_set_statusline = 0
      vim.g.VM_silent_exit = 1

      local function get_vm_mode()
        if not vim.b.visual_multi then
          return nil
        end
        local ok, result = pcall(vim.fn["vm#themes#statusline"])
        return ok and vim.iter(string.gmatch(result, "%S+")):nth(2) or nil
      end

      local function get_vm_status()
        local ok, vm_infos = pcall(vim.fn.VMInfos)
        return ok and (vm_infos.status or "") or ""
      end

      return { mode = get_vm_mode, status = get_vm_status }
    end

    local vm = setup_visual_multi()

    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return " " .. (vm.mode() or mode:sub(1, 3))
            end,
          },
        },

        -- lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {

          Snacks.profiler.status(),
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Constant") }
            end,
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return { fg = Snacks.util.color("Debug") }
            end,
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { "progress" },
          { "location" },
        },
        lualine_y = {
          { buf_get_active_clients_str, cond = hide_in_width },

          -- { "os.date('%a')", "data", "require'lsp-status'.status()" },
          -- { "require'lsp-status'.status()", separator = " ", padding = { left = 1, right = 0 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    local function autocmds()
      -- -- Recording status updates
      -- vim.api.nvim_create_autocmd("RecordingEnter", {
      --   callback = function()
      --     require("lualine").refresh({ place = { "statusline" } })
      --   end,
      -- })
      --
      -- vim.api.nvim_create_autocmd("RecordingLeave", {
      --   callback = function()
      --     local timer = vim.uv.new_timer()
      --     if timer then
      --       timer:start(
      --         50,
      --         0,
      --         vim.schedule_wrap(function()
      --           require("lualine").refresh({ place = { "statusline" } })
      --         end)
      --       )
      --     end
      --   end,
      -- })

      -- Visual-Multi updates
      vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
        pattern = { "@" },
        callback = function()
          if vim.b.visual_multi then
            vim.defer_fn(function()
              vim.cmd('execute "redrawstatus"')
            end, 0)
          end
        end,
      })
    end

    autocmds()

    return opts
  end,
}

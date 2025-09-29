if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local utils = require("config.utils")
local icons = require("config.icons")
utils.desc("<leader>a", "AI")

-- Copilot autosuggestions
vim.g.copilot_no_tab_map = true
vim.g.copilot_hide_during_completion = false
vim.g.copilot_proxy_strict_ssl = false
vim.g.copilot_integration_id = "vscode-chat"
vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

return {
  -- { import = "plugins.copilot-vim" }, -- Uncomment if you need this import
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
        { "gm", group = "+Copilot chat" },
        { "gmh", desc = "Show help" },
        { "gmd", desc = "Show diff" },
        { "gmp", desc = "Show system prompt" },
        { "gms", desc = "Show selection" },
        { "gmy", desc = "Yank diff" },
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = "CopilotChat",
    branch = "main",
    build = "make tiktoken", -- Only on MacOS or Linux
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      { "nvim-telescope/telescope.nvim" },
      { "github/copilot.vim" }, -- or use { "zbirenbaum/copilot.lua" }
    },

    opts = function()
      local chat = require("CopilotChat")
      local prompts = require("CopilotChat.config.prompts")
      local select = require("CopilotChat.select")
      local cutils = require("CopilotChat.utils")

      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)

      -- Define system prompts
      local COPILOT_PLAN = [[
You are a software architect and technical planner focused on clear, actionable development plans.
]] .. prompts.COPILOT_BASE.system_prompt .. [[

When creating development plans:
- Start with a high-level overview
- Break down into concrete implementation steps
- Identify potential challenges and their solutions
- Consider architectural impacts
- Note required dependencies or prerequisites
- Estimate complexity and effort levels
- Track confidence percentage (0-100%)
- Format in markdown with clear sections

Always end with:
"Current Confidence Level: X%"
"Would you like to proceed with implementation?" (only if confidence >= 90%)
]]

      -- Define prompt commands
      local custom_prompts = {
        Explain = {
          mapping = "<leader>ae",
          description = "AI Explain",
        },
        Review = {
          mapping = "<leader>ar",
          description = "AI Review",
        },
        Tests = {
          mapping = "<leader>at",
          description = "AI Tests",
        },
        Fix = {
          mapping = "<leader>af",
          description = "AI Fix",
        },
        Optimize = {
          mapping = "<leader>ao",
          description = "AI Optimize",
        },
        Docs = {
          mapping = "<leader>ad",
          description = "AI Documentation",
        },
        Commit = {
          mapping = "<leader>ac",
          description = "AI Generate Commit",
          selection = select.buffer,
        },
        Refactor = {
          mapping = "<leader>aR",
          description = "AI Refactor",
        },
        BetterNamings = {
          mapping = "<leader>an",
          description = "AI Better Naming",
        },
        Plan = {
          prompt = "Create or update the development plan for the selected code. Focus on architecture, implementation steps, and potential challenges.",
          system_prompt = COPILOT_PLAN,
          context = "file:.copilot/plan.md",
          progress = function()
            return false
          end,
          callback = function(response, source)
            chat.chat:append("Plan updated successfully!", source.winnr)
            local plan_file = source.cwd() .. "/.copilot/plan.md"
            local dir = vim.fn.fnamemodify(plan_file, ":h")
            vim.fn.mkdir(dir, "p")
            local file = io.open(plan_file, "w")
            if file then
              file:write(response)
              file:close()
            end
          end,
        },
      }

      return {
        model = "claude-3.7-sonnet",
        debug = true,
        chat_autocomplete = true,
        history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
        auto_insert_mode = true,
        context = "buffers", -- Can be "buffer", "buffers", or "files"
        sticky = "#buffer",
        references_display = "write",
        auto_follow_cursor = false,
        insert_at_end = true,

        -- Headers
        question_header = " " .. (icons.ui and icons.ui.User or "  " .. user .. " "),
        answer_header = " " .. (icons.ui and icons.ui.Bot or "  Copilot "),
        error_header = "> " .. (icons.diagnostics and icons.diagnostics.Warn or "## Error "),

        -- Window settings
        window = {
          width = 0.4,
          layout = "float", -- Can adjust based on your preference
        },

        -- Combined prompts from all files
        prompts = custom_prompts,

        -- Default selection method
        selection = select.visual, -- Default to visual selection

        mappings = {
          -- Use tab for completion
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.",
            insert = "<Tab>",
          },
          -- Close the chat
          close = {
            normal = "q",
            insert = "<C-c>",
          },
          -- Reset the chat buffer
          reset = false, -- Disabled as we have a custom keybinding
          -- Submit the prompt to Copilot
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-CR>",
          },
          -- Accept the diff
          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },
          -- Yank the diff in the response to register
          yank_diff = {
            normal = "gmy",
          },
          -- Show the diff
          show_diff = {
            normal = "gmd",
            full_diff = true,
          },
          -- Show the info
          show_info = {
            normal = "gmi",
          },
          -- Show the context
          show_context = {
            normal = "gmc",
          },
          -- Show help
          show_help = {
            normal = "gmh",
          },
        },

        -- Vector space context for semantic search
        contexts = {
          vectorspace = {
            description = "Semantic search through workspace using vector embeddings. Find relevant code with natural language queries.",

            schema = {
              type = "object",
              required = { "query" },
              properties = {
                query = {
                  type = "string",
                  description = "Natural language query to find relevant code.",
                },
                max = {
                  type = "integer",
                  description = "Maximum number of results to return.",
                  default = 10,
                },
              },
            },

            resolve = function(input, source, prompt)
              local embeddings = cutils.curl_post("http://localhost:8000/query", {
                json_request = true,
                json_response = true,
                body = {
                  dir = source.cwd(),
                  text = input.query or prompt,
                  max = input.max,
                },
              }).body

              cutils.schedule_main()
              return vim
                .iter(embeddings)
                :map(function(embedding)
                  embedding.filetype = cutils.filetype(embedding.filename)
                  return embedding
                end)
                :filter(function(embedding)
                  return embedding.filetype
                end)
                :totable()
            end,
          },
        },

        -- Disable GitHub models as we're using Claude
        providers = {
          github_models = {
            disabled = true,
          },
        },
      }
    end,

    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      chat.setup(opts)

      -- Create custom commands
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      -- Custom buffer for CopilotChat
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false

          -- Get current filetype and set it to markdown if the current filetype is copilot-chat
          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,

    keys = {
      -- Main Keybindings
      {
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "AI Toggle",
      },
      {
        "<leader>aa",
        function()
          require("CopilotChat").open()
        end,
        mode = "v",
        desc = "AI Open",
      },
      {
        "<leader>ax",
        function()
          require("CopilotChat").reset()
        end,
        desc = "AI Reset",
      },
      {
        "<leader>as",
        function()
          require("CopilotChat").stop()
        end,
        desc = "AI Stop",
      },
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "AI Models",
      },
      {
        "<leader>ag",
        function()
          require("CopilotChat").select_agent()
        end,
        desc = "AI Agents",
      },

      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },

      -- Code related commands
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Generate Documentation" },

      -- Chat with Copilot in visual mode
      {
        "<leader>av",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ax",
        ":CopilotChatInline<cr>",
        mode = "x",
        desc = "CopilotChat - Inline chat",
      },

      -- Custom input for CopilotChat
      {
        "<leader>aq",
        function()
          vim.ui.input({
            prompt = "AI Question> ",
          }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "CopilotChat - Ask question",
      },

      -- Generate commit message based on the git diff
      {
        "<leader>ac",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },

      -- Copilot Chat Models
      { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },

      -- Reload history
      {
        "<leader>ah",
        function()
          local chat = require("CopilotChat")
          local history_path = vim.fn.stdpath("data") .. "/copilotchat_history"
          -- Check if history file exists
          if vim.fn.filereadable(history_path) == 1 then
            chat.reload_history()
            vim.notify("Chat history reloaded", vim.log.levels.INFO)
          else
            vim.notify("No chat history found", vim.log.levels.WARN)
          end
        end,
        desc = "CopilotChat - Reload previous chat",
      },
    },
  },
}

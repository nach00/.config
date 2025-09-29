-- local ip = "192.168.1.100"

-- Code related prompts
-- local prompts = {
--   Explain = "Please explain how the following code works.",
--   Review = "Please review the following code and provide suggestions for improvement.",
--   tests = "Please explain how the selected code works, then generate unit tests for it.",
--   Refactor = "Please refactor the following code to improve its clarity and readability.",
--   FixCode = "Please fix the following code to make it work as intended.",
--   FixError = "Please explain the error in the following text and provide a solution.",
--   BetterNamings = "Please provide better names for the following variables and functions.",
--   Documentation = "Please provide documentation for the following code.",
--   SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
--   SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
--   -- Text related prompts
--   Summarize = "Please summarize the following text.",
--   Spelling = "Please correct any grammar and spelling errors in the following text.",
--   Concise = "Please rewrite the following text to make it more concise.",
--   Wording = "Please improve the grammar and wording of the following text.",
-- }

return {
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
    branch = "main",
    cmd = "CopilotChat",
    build = "make tiktoken", -- Only on MacOS or Linux
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
        event = "VeryLazy",
        debug = true,
        chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
        history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
        reference_display = "write",
        insert_at_end = true, -- Move cursor to end of buffer when inserting text
        -- prompts = prompts,
        auto_follow_cursor = false, -- Don't follow the cursor after getting response
        context = "#files",
        sticky = "#buffer",
        model = "gemini-2.5-pro",
        -- model = "claude-3.7-sonnet",
        auto_insert_mode = false,

        -- Headers
        -- question_header = " " .. (icons.ui and icons.ui.User or "  " .. user .. " "),
        -- answer_header = " " .. (icons.ui and icons.ui.Bot or "  Copilot "),
        -- error_header = "> " .. (icons.diagnostics and icons.diagnostics.Warn or "## Error "),
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        error_header = "## Error ",

        mappings = {
          -- Use tab for completion
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.",
            insert = "<Tab>",
          },
          -- Close the chat
          close = {
            normal = "<Esc>",
            insert = "<C-c>",
          },
          -- Reset the chat buffer
          reset = {
            normal = "<C-x>",
            insert = "<C-x>",
          },
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
        window = {
          -- layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
          width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
          height = 0.5, -- fractional height of parent, or absolute height in rows when > 1

          -- Options below only apply to floating windows
          layout = "float", -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
          relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
          border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
          row = nil, -- row position of the window, default is centered
          col = nil, -- column position of the window, default is centered
          title = "Copilot Chat", -- title of chat window
          footer = nil, -- footer of chat window
          zindex = 1, -- determines if window is on top or below other floating windows
        },

        -- Combined prompts from all files
        prompts = custom_prompts,

        -- Default selection method
        selection = select.visual, -- Default to visual selection

        -- providers = {
        --   github_models = {
        --     disabled = true,
        --   },
        --   ollama = {
        --     prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
        --     prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,
        --
        --     get_models = function(headers)
        --       local response, err = require("CopilotChat.utils").curl_get("http://" .. ip .. ":11434/v1/models", {
        --         headers = headers,
        --         json_response = true,
        --       })
        --
        --       if err then
        --         error(err)
        --       end
        --
        --       return vim.tbl_map(function(model)
        --         return {
        --           id = model.id,
        --           name = model.id,
        --         }
        --       end, response.body.data)
        --     end,
        --
        --     embed = function(inputs, headers)
        --       local response, err = require("CopilotChat.utils").curl_post("http://" .. ip .. ":11434/v1/embeddings", {
        --         headers = headers,
        --         json_request = true,
        --         json_response = true,
        --         body = {
        --           input = inputs,
        --           model = "all-minilm",
        --         },
        --       })
        --
        --       if err then
        --         error(err)
        --       end
        --
        --       return response.body.data
        --     end,
        --
        --     get_url = function()
        --       return "http://" .. ip .. ":11434/v1/chat/completions"
        --     end,
        --   },
        -- },
      }
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
      -- { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      -- { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      -- { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review code" },
      -- { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code" },
      -- { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better Naming" },
      -- { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "Debug Info" },
      -- { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
      -- { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "Clear buffer and chat history" },
      -- { "<leader>av", "<cmd>CopilotChatToggle<CR>", desc = "Toggle" },
      -- { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "Select Models" },
      {
        "<leader>a?",
        "<cmd>CopilotChatModels<CR>",
        desc = "Select model",
        mode = { "n", "v" },
      },
      -- Show prompts actions with telescope
      -- {
      --   "<leader>ap",
      --   function()
      --     local actions = require("CopilotChat.actions")
      --     -- require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      --     require("CopilotChat.select_prompt").pick()
      --   end,
      --   desc = "CopilotChat - Prompt actions",
      -- },
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
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      -- Quick chat with Copilot
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Debug
      { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
      -- Fix the issue with diagnostic
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      -- Clear buffer and chat history
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>av", "<cmd>CopilotChatToggle<CR>", desc = "CopilotChat - Toggle" },
      -- Copilot Chat Models
      { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
      {
        "<leader>ao",
        function()
          local chat = require("CopilotChat")
          local history_path = vim.fn.stdpath("data") .. "/copilotchat_history"
          -- Check if history file exists
          if vim.fn.filereadable(history_path) == 1 then
            chat.reload_history()
          else
            vim.notify("No chat history found", vim.log.levels.WARN)
          end
        end,
        desc = "CopilotChat - Reload previous chat",
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      local select = require("CopilotChat.select")
      -- Use unnamed register for the selection
      opts.selection = select.unnamed

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
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          -- Get current filetype and set it to markdown if the current filetype is copilot-chat
          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
}

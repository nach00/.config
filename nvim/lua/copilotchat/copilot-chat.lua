if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Copilot autosuggestions
vim.g.copilot_no_tab_map = true
vim.g.copilot_hide_during_completion = false
vim.g.copilot_proxy_strict_ssl = false
vim.g.copilot_integration_id = "vscode-chat"
vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }

vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
-- Copilot chat
local chat = require("CopilotChat")
local prompts = require("CopilotChat.config.prompts")
local select = require("CopilotChat.select")
local providers = require("CopilotChat.config.providers")
local cutils = require("CopilotChat.utils")

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

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  build = "make tiktoken", -- Only on MacOS or Linux
  cmd = "CopilotChat",
  dependencies = {
    -- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    { "zbirenbaum/copilot.lua" },
  },
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      -- context = "buffers",
      context = "files",
      sticky = "#buffer",
      model = "claude-3.7-sonnet",
      -- model = "claude-3.7-sonnet-thought",
      -- model = "deepseek-r1",
      references_display = "write",
      debug = true,
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.6,
      },
      providers = {
        github_models = {
          disabled = true,
        },
        {
          ollama = {
            prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
            prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

            get_models = function(headers)
              local response, err = require("CopilotChat.utils").curl_get("http://192.168.1.107:11434/v1/models", {
                headers = headers,
                json_response = true,
              })

              if err then
                error(err)
              end

              return vim.tbl_map(function(model)
                return {
                  id = model.id,
                  name = model.id,
                }
              end, response.body.data)
            end,

            embed = function(inputs, headers)
              local response, err = require("CopilotChat.utils").curl_post("http://192.168.1.107:11434/v1/embeddings", {
                headers = headers,
                json_request = true,
                json_response = true,
                body = {
                  input = inputs,
                  model = "all-minilm",
                },
              })

              if err then
                error(err)
              end

              return response.body.data
            end,

            get_url = function()
              return "http://192.168.1.107:11434/v1/chat/completions"
            end,
          },
        },
      },
    }
  end,
  keys = {
    { "<leader>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}

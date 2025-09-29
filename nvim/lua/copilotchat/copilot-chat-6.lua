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

-- Copilot chat
local chat = require("CopilotChat")
local prompts = require("CopilotChat.config.prompts")
local select = require("CopilotChat.select")
local cutils = require("CopilotChat.utils")

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  cmd = "CopilotChat",
  build = "make tiktoken", -- Only on MacOS or Linux
  branch = "main",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    { "zbirenbaum/copilot.lua" },
  },
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      -- context = "buffer",
      context = "files",
      sticky = "#buffer",
      model = "claude-3.7-sonnet",
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      prompts = {
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
        -- Plan = {
        --   prompt = "Create or update the development plan for the selected code. Focus on architecture, implementation steps, and potential challenges.",
        --   system_prompt = [[
        --     You are a software architect and technical planner focused on clear, actionable development plans.
        --     ]] .. prompts.COPILOT_BASE.system_prompt .. [[
        --
        --     When creating development plans:
        --     - Start with a high-level overview
        --     - Break down into concrete implementation steps
        --     - Identify potential challenges and their solutions
        --     - Consider architectural impacts
        --     - Note required dependencies or prerequisites
        --     - Estimate complexity and effort levels
        --     - Track confidence percentage (0-100%)
        --     - Format in markdown with clear sections
        --
        --     Always end with:
        --     "Current Confidence Level: X%"
        --     "Would you like to proceed with implementation?" (only if confidence >= 90%)
        --     ]],
        --   context = "file:.copilot/plan.md",
        --   progress = function()
        --     return false
        --   end,
        --   callback = function(response, source)
        --     chat.chat:append("Plan updated successfully!", source.winnr)
        --     local plan_file = source.cwd() .. "/.copilot/plan.md"
        --     local dir = vim.fn.fnamemodify(plan_file, ":h")
        --     vim.fn.mkdir(dir, "p")
        --     local file = io.open(plan_file, "w")
        --     if file then
        --       file:write(response)
        --       file:close()
        --     end
        --   end,
        -- },
      },
      providers = {
        github_models = {
          disabled = true,
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

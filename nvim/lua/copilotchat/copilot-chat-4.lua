if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  build = "make tiktoken", -- Only on MacOS or Linux
  cmd = "CopilotChat",
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
      },
      providers = {
        github_models = {
          disabled = true,
        },

        ollama = {
          prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
          prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

          get_models = function(headers)
            local response, err = require("CopilotChat.utils").curl_get("http://192.168.107:11434/v1/models", {
              headers = config.get_headers(),
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
            local response, err = require("CopilotChat.utils").curl_post("http://192.168.107:11434/v1/embeddings", {
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
            return "http://192.168.107:11434/v1/chat/completions"
          end,
        },
      },
    }
  end,
  keys = {
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
    { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
    { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
    { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
    { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
    { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    { "<leader>av", "<cmd>CopilotChatToggle<CR>", desc = "CopilotChat - Toggle" },
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

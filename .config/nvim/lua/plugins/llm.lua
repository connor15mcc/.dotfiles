return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
      agents = {
        {
          name = "ChatGPT4o",
          disable = true,
        },
        {
          name = "CodeGPT4o",
          disable = true,
        },
      },
      hooks = {
        -- example of adding command which writes unit tests for the selected code
        UnitTests = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by writing table driven unit tests for the code above."
            .. "Use Testify library when writing Go tests."
            .. "{{command}}"
          local agent = gp.get_command_agent()
          gp.Prompt(params, gp.Target.vnew, agent, template)
        end,
        CodeReview = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please analyze for code smells and suggest improvements. Do not"
            .. "echo the existing code back to me. Include your suggestions in"
            .. "the format of concise, two-sentence bullet points"
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.vnew("markdown"), agent, template)
        end,
      },
    }

    vim.keymap.set(
      { "v" },
      "<leader>li",
      ":'<,'> GpImplement<cr>",
      { noremap = true, silent = true, nowait = true, desc = "Implement comment stubs" }
    )
    vim.keymap.set(
      { "v" },
      "<leader>lr",
      ":'<,'> GpCodeReview<cr>",
      { noremap = true, silent = true, nowait = true, desc = "Start a code review" }
    )
    vim.keymap.set(
      { "v" },
      "<leader>lt",
      ":'<,'> GpUnitTests ",
      { noremap = true, silent = true, nowait = true, desc = "Add unit tests" }
    )

    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "proselint", "write_good" },
      },
      linters = {
        proselint = {
          cmd = "proselint",
          stdin = false,
          args = {},
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(
            "([^:]+):(%d+):(%d+): ([^ ]+) (.*)",
            { "file", "lnum", "col", "code", "message" },
            nil,
            { ["source"] = "proselint", ["severity"] = vim.diagnostic.severity.HINT }
          ),
        },
        write_good = {
          cmd = "write-good",
          stdin = false,
          args = { "--parse" },
          stream = "stdout",
          ignore_exitcode = true,
          env = nil,
          parser = require("lint.parser").from_pattern(
            [=[%w+:(%d+):(%d+):(.*)]=],
            { "lnum", "col", "message" },
            nil,
            { ["source"] = "write_good", ["severity"] = vim.diagnostic.severity.HINT }
          ),
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}

return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", "<cmd>Mason<CR>", desc = "Launch Mason" },
  },
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "prettierd",
      "proselint",
      "write-good",
    },
  },
}

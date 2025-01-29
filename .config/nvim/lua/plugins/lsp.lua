return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- local lspconfig = require("lspconfig")
      local mason = require("mason")
      mason.setup()
    end,
  },
}

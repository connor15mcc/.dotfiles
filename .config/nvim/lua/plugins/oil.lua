return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "permissions",
      "size",
      "mtime",
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>",
      desc = "Open current dir",
    },
  },
}

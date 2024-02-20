return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true,
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

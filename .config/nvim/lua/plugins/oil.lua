return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    columns = {
      "mtime",
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
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


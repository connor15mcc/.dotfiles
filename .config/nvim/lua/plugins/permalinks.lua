return {
  "ruifm/gitlinker.nvim",
  opts = {
    print_url = false,
    mappings = nil,
    silent = true,
  },
  keys = {
    {
      "<leader>gl",
      function()
        require("gitlinker").get_buf_range_url("n")
      end,
      desc = "copy permalink",
      mode = { "n" },
    },
    {
      "<leader>gl",
      function()
        require("gitlinker").get_buf_range_url("v")
      end,
      desc = "copy permalink",
      mode = { "v" },
    },
  },
}

return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      render_style = "compact",
      timeout = 100,
      top_down = false,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = false,
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
  },
}

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Default options
      require("kanagawa").setup({
        transparent = true,

        colors = {
          theme = { all = { ui = { bg_gutter = "none" } } }, -- no background for sign/line gutter
        },
      })

      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}

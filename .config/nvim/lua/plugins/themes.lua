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
          theme = {
            all = {
              ui = { bg_gutter = "none" },
              diag = {
                info = "none",
                -- make TODOs yellow
                -- todo def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/highlights/treesitter.lua#L107
                -- color def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/colors.lua#L28C20-L28C27
                hint = "#FF9E3B",
              },
            },
          }, -- no background for sign/line gutter
        },
      })

      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}

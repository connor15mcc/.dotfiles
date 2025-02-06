return {
	{
		"rebelot/kanagawa.nvim",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Default options
			require("kanagawa").setup({
				transparent = true,

				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								bg_m3 = "none",
								-- make md checkboxes always the same color (highlighted or not)
								fg_reverse = "#FF9E3B",
							},
							diag = {
								-- info = "none",
								-- make hints less bright
								hint = "#658594",
								-- make TODOs yellow
								-- todo def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/highlights/treesitter.lua#L107
								-- color def: https://github.com/rebelot/kanagawa.nvim/blob/e5f7b8a804360f0a48e40d0083a97193ee4fcc87/lua/kanagawa/colors.lua#L28C20-L28C27
								hint = "#658594",
							},
						},
					}, -- no background for sign/line gutter
				},

				overrides = function(colors)
					local theme = colors.theme
					return {
						Todo = { bg = "none", fg = theme.diag.warning },
					}
				end,
			})

			vim.cmd("colorscheme kanagawa-wave")
		end,
	},
}

return {
	-- TODO: I'm 99.99999% sure we want fugitive..
	{
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
		}
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			signcolumn = false,
			numhl = true,
			word_diff = false,
		},
	}
}

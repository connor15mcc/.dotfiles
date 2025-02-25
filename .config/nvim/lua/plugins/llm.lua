return {
	{
		"olimorris/codecompanion.nvim",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			log_level = "DEBUG",
		},
		keys = {
			{ "<leader>a", "<cmd>CodeCompanionActions<cr>",  noremap = true, silent = true },
			{ "ga",        "<cmd>CodeCompanionChat Add<cr>", mode = "v",     noremap = true, silent = true },
		},
	},
}

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = {
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		opts = {
			quiet_mode = false,
		},
	},
}

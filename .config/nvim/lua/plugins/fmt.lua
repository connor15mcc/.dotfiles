return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = false,
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
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
      formatters = {
        sleek = { command = "sleek" },
      },
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
        sql = { "sleek" },
        ["*"] = { "injected" }, -- enables injected-lang formatting for all filetypes
			},
		},
	},
	{
		"LittleEndianRoot/mason-conform",
	},
}

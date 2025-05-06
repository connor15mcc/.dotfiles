return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			-- local lspconfig = require("lspconfig")
			local mason = require("mason")
			mason.setup()
			require("mason-lspconfig").setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {}
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				["rust_analyzer"] = function()
					require("lspconfig").rust_analyzer.setup {
						settings = {
							["rust-analyzer"] = {
								rustfmt = {
									extraArgs = { "+nightly", },
								},
							}
						}
					}
				end
			}
		end,
	},
}

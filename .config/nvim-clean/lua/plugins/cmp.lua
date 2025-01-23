return {
	"saghen/blink.cmp",
	lazy = false,
	version = "v0.*",
	opts = {
		keymap = {
			["<C-p>"] = { "select_prev" },
			["<C-n>"] = { "select_next" },
			["<C-b>"] = { "scroll_documentation_down" },
			["<C-f>"] = { "scroll_documentation_up" },
			["<C-j>"] = { "cancel" },
			["<C-k>"] = { "select_and_accept" },
		},
		completion = {
			menu = {
				draw = {
					columns = {
						{ "label", "label_description" },
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}

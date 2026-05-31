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
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, {
					buffer = buffer, desc = "Next Hunk" })
				vim.keymap.set("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, { buffer = buffer, desc = "Prev Hunk" })
				vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { buffer = buffer, desc = "Stage Hunk" })
				vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { buffer = buffer, desc = "Reset Hunk" })
			end,
		}
	},
	{
		"https://tangled.org/ronshavit.com/jjannotate.nvim",
		keys = {
			{
				"<leader>jb",
				function()
					require("jjannotate").open()
				end,
				desc = "blame",
				mode = { "n" },
			},
		}
	}
}

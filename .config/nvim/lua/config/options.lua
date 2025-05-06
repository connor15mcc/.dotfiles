-- TODO: should come and short / break up by use
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.sidescroll = 0
vim.opt.directory = "."
vim.opt.signcolumn = "no"
vim.opt.conceallevel = 0
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.spellcapcheck = ""
vim.opt.cmdheight = 0
vim.opt.grepformat = "%f:%l:%m"
vim.opt.inccommand = "nosplit"
vim.opt.list = true -- show invisible chars
vim.opt.smartcase = true
vim.opt.virtualedit = "block"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Make yank clipboard work w/ system clipboard. plus is for linux to ensure it uses the copy clipboard not the selection.
-- The use of a function pushes this until after UiEnter which lowers startup time according to https://github.com/nvim-lua/kickstart.nvim/blob/d350db2449da40df003c40d440f909d74e2d4e70/init.lua#L115-L116
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- handle tabs:
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.filetype.add({
	pattern = {
		[".*.jjdescription"] = "gitcommit",
	},
})

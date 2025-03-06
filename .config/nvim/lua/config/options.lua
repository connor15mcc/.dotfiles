local opt = vim.opt

-- TODO: should come and short / break up by use
opt.linebreak = true
opt.scrolloff = 5
opt.textwidth = 80
opt.colorcolumn = "80"
opt.wrap = false
opt.sidescroll = 0
opt.directory = "."
opt.signcolumn = "no"
opt.conceallevel = 0
opt.undofile = true
opt.spell = true
opt.spellcapcheck = ""
opt.cmdheight = 0
opt.grepformat = "%f:%l:%m"
opt.clipboard = "unnamedplus"
opt.inccommand = "nosplit"
opt.list = true -- show invisible chars
opt.smartcase = true
opt.virtualedit = "block"
opt.splitright = true
opt.splitbelow = true

-- handle tabs:
opt.autoindent = true
opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2

vim.filetype.add({
	pattern = {
		[".*.jjdescription"] = "gitcommit",
	},
})

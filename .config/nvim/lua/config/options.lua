-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.sidescrolloff = 0
vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.directory = "."
vim.opt.signcolumn = "no"
vim.opt.conceallevel = 0
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.spellcapcheck = ""

vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%m"

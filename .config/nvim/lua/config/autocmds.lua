-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- OVERRIDE: **dont** "go to last loc when opening a buffer"
vim.api.nvim_create_augroup("lazyvim_last_loc", { clear = true })

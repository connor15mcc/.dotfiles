-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>ul", function()
  if vim.opt_local.number:get() then
    vim.opt_local.number = false
    vim.opt_local.signcolumn = "no"
  else
    vim.opt_local.number = true
    vim.opt_local.signcolumn = "auto"
  end
end, { desc = "Toggle Line Numbers" })

vim.cmd('setlocal tabstop=2')
vim.cmd('setlocal shiftwidth=2')

vim.notify "attaching LSP"

local client = vim.lsp.start_client {
  name = "lspb",
  cmd = { "/Users/connormccarthy/projects/lspb/target/debug/lspb" },
}
if not client then
  vim.notify "client is borked"
end
vim.lsp.buf_attach_client(0, client)

vim.notify "client should be attached"

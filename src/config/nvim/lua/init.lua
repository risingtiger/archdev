

vim.api.nvim_set_keymap('n', '<Leader>p', '"0p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':noh', { noremap = true, silent = true })


-- Setup lspconfig.
local capabilities   =   require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspss          =   require('lspconfig')
lspss.tsserver.setup {   capabilities = capabilities   }



-- Setup lspconfig.

local capabilities        =   require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspss               =   require('lspconfig')
lspss.rust_analyzer.setup {   capabilities = capabilities }
lspss.tsserver.setup      {   capabilities = capabilities }
lspss.ccls.setup          {   capabilities = capabilities, init_options = { highlight = { lsRanges = true; } }   }

-- require('telescope').load_extension('fzy_native')


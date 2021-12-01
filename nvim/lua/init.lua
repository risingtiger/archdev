


-- Setup lspconfig.
local capabilities   =   require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspss          =   require('lspconfig')
lspss.tsserver.setup {   capabilities = capabilities, 
    on_attach = function(client, bufnr) 
        require "lsp_signature".on_attach() 
    end
}
lspss.ccls.setup     {   capabilities = capabilities, init_options = { highlight = { lsRanges = true; } }   }


require('telescope').load_extension('fzf')


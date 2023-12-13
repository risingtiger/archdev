
local lsp = require("lsp-zero").preset({})


lsp.ensure_installed({
})


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)

    lsp.default_keymaps({buffer=bufnr})

    vim.keymap.set('n', 'gR', vim.lsp.buf.rename)

    -- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})

    -- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

    -- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

    -- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().

    -- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().

    -- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().

    -- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().

    -- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

    -- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().

    -- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().

    -- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().

    -- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().

    -- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().

    -- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().



    -- nvm-cmp STUFF

    -- The default keybindings in lsp-zero are meant to emulate Neovim's default whenever possible.

    -- <Ctrl-y>: Confirms selection.

    -- <Ctrl-e>: Cancel completion.

    -- <Down>: Navigate to the next item on the list.

    -- <Up>: Navigate to previous item on the list.

    -- <Ctrl-n>: If the completion menu is visible, go to the next item. Else, trigger completion menu.

    -- <Ctrl-p>: If the completion menu is visible, go to the previous item. Else, trigger completion menu.

    -- <Ctrl-d>: Scroll down the documentation window.

    -- <Ctrl-u>: Scroll up the documentation window.

end)

lsp.skip_server_setup({'rust_analyzer'})

lsp.setup()

local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', 'K', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
            --vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
        end
    },
    tools = {
        inlay_hints = {
            auto = false
        }
    }
})




local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  --mapping = {
  --  ['<C-f>']   = cmp_action.luasnip_jump_forward(),
  --  ['<C-b>']   = cmp_action.luasnip_jump_backward(),
  --  ['<Tab>']   = cmp_action.luasnip_supertab(),
  --  ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  --}
    
})




require'lspconfig'.lua_ls.setup { settings = { Lua = { diagnostics = { globals = {'vim'} } } } }




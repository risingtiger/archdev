
local fn = vim.fn




-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end




return require('packer').startup(function()

    use {
        'hrsh7th/nvim-cmp', 
        requires = { 
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function() 
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                -- mapping = {
                --     ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                --     ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                --     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                --     ['<C-y>']     = cmp.config.disable,
                --     ['<C-e>']     = cmp.mapping({
                --         i         = cmp.mapping.abort(),
                --         c         = cmp.mapping.close(),
                --     }),
                --     ['<CR>']      = cmp.mapping.confirm({ select = true }),  
                -- },
                sources           = cmp.config.sources({
                   { name        = 'nvim_lsp' },
                   { name        = 'luasnip' }, 
                   { name        = 'buffer' },
                   { name        = 'path' },
                })
            }) 

            local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

            require('lspconfig')['tsserver'].setup { capabilities = capabilities }
            require('lspconfig')['ccls'].setup { capabilities = capabilities }
            require('lspconfig')['cssls'].setup { capabilities = capabilities }
            require('lspconfig')['html'].setup { capabilities = capabilities }
            require('lspconfig')['jsonls'].setup { capabilities = capabilities }
            require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
        end
    }






    use { 
        "nvim-treesitter/nvim-treesitter", 
        config = function() 
            require('nvim-treesitter.configs').setup({
                ensure_installed = "maintained",
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                autopairs = {
                    enable = true,
                },
                indent = { enable = true, disable = { "yaml" } },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            }) 
        end
    }


    use {
        "windwp/nvim-autopairs",
        config = function() 
            require("nvim-autopairs").setup({
              check_ts = true,
              ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
              },
              disable_filetype = { "TelescopePrompt", "spectre_panel" },
              fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
              },
            })
        end
    }


    use {
        "numToStr/Comment.nvim",
        config = function() 
            require("Comment").setup({})
        end
    }


    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim" 
    use "nvim-lua/plenary.nvim"
    use "L3MON4D3/LuaSnip"

    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    use 'nvim-telescope/telescope.nvim'
    use "nvim-lualine/lualine.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "preservim/nerdtree"
    use "morhetz/gruvbox"
    use "tpope/vim-surround"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

    -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    --use "junegunn/vim-easy-align"
    -- use "kyazdani42/nvim-web-devicons"

    -- use "lewis6991/gitsigns.nvim"
end)

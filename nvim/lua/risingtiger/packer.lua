

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use "MunifTanjim/nui.nvim"
    use 'nvim-tree/nvim-web-devicons'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- use {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     after = 'nvim-treesitter',
    -- }


    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make', cond = vim.fn.executable 'make' == 1 }


    use 'simrat39/rust-tools.nvim'


    use ({ "ellisonleao/gruvbox.nvim", as = "gruvbox", config = function()  end })
    --use { "catppuccin/nvim", as = "catppuccin" }


    use ({
        'stevearc/aerial.nvim',
        event = "InsertEnter",
        config = function()
            require('aerial').setup()
        end,
    })


    use ({
        'github/copilot.vim',
        config = function()

        end
    })


    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "InsertEnter",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })


    use({
        'tpope/vim-fugitive',
        event = "InsertEnter"
    })


    use({
        'jakemason/ouroboros',
        event = "InsertEnter"
    })


    use 'lukas-reineke/indent-blankline.nvim'

    use { 'sindrets/diffview.nvim' }



    use { 'theprimeagen/harpoon' }



end)





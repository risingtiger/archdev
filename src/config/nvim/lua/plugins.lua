

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'tamago324/nlsp-settings.nvim'
  use 'williamboman/nvim-lsp-installer'

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        })
      })
    end,
    requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lua'}
  }

  use { 
    'nvim-telescope/telescope.nvim',
    config = function()
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }


  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require('Comment').setup({
      })
    end
  }

  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs.completion.cmp").setup({
  --       map_cr = true, --  map <CR> on insert mode
  --       map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  --       auto_select = true, -- automatically select the first item
  --       insert = false, -- use insert confirm behavior instead of replace
  --       map_char = { -- modifies the function or method delimiter by filetypes
  --         all = '(',
  --         tex = '{'
  --       }
  --     })
  --   end
  -- }

  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   branch = "0.5-compat",
  --   config = function()
  --   end,
  --   run = ':TSUpdate'
  -- }
  --
  -- use {
  --   "kyazdani42/nvim-tree.lua",
  --   config = function()
  --   end
  -- }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
    end
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
    end
  }

  use 'morhetz/gruvbox'

  use 'preservim/nerdtree'

  use 'kyazdani42/nvim-web-devicons'

  use 'tpope/vim-surround'

  use 'm-pilia/vim-ccls'

  use 'junegunn/vim-easy-align'


end)

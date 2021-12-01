

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use 'nvim-lua/plenary.nvim'

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        -- snippet = {
        --  expand = function(args)
        --    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        --  end,
        -- },
        mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        })
      })
    end,
    requires = {'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lua'}
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
    end
  }

  use {
    'rafamadriz/friendly-snippets',
    event = "InsertEnter",
    config = function()
    end
  }

  use {
    'nvim-telescope/telescope-fzy-native.nvim',
    event = "InsertEnter"
  }
  use { 
    'nvim-telescope/telescope.nvim',
    event = "InsertEnter",
    config = function()
      require('telescope').setup {
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          }
        }
      }
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
    end
  }

  use {
    "jackguo380/vim-lsp-cxx-highlight",
    event = "InsertEnter",
    config = function()
    end
  }

    use {
        'lewis6991/gitsigns.nvim',
        event = "InsertEnter",
        config = function()
            require('gitsigns').setup {
              signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
              numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
              linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
              word_diff  = false -- Toggle with `:Gitsigns toggle_word_diff`
            }
        end
    }
  
  use {
    "morhetz/gruvbox",
  }
  
  use {
    "preservim/nerdtree",
    event = "InsertEnter"
  }
  
  use {
    "kyazdani42/nvim-web-devicons",
    event = "InsertEnter"
  }

  use {
    "tpope/vim-surround",
    event = "InsertEnter"
  }
  
  use {
    "m-pilia/vim-ccls",
    event = "InsertEnter"
  }
  
  use {
    "junegunn/vim-easy-align",
    event = "InsertEnter"
  }
  
  use {
    "tmsvg/pear-tree",
    event = "InsertEnter"
  }

  use {
    "junegunn/fzf",
    event = "InsertEnter"
  }

  use {
    "junegunn/fzf.vim",
    event = "InsertEnter"
  }

  use {
    "tpope/vim-commentary",
    event = "InsertEnter"
  }

end)





return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

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
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
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
    'ray-x/lsp_signature.nvim',
    config = function()
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
    end
  }

  use {
    'rafamadriz/friendly-snippets',
    config = function()
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use { 
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        }
      }
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  }


  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require('Comment').setup({
      })
    end
  }

-- use 
-- {
--     "windwp/nvim-autopairs",
--     config = function()
--         require("nvim-autopairs.completion.cmp").setup({
--             map_cr = true, --  map <CR> on insert mode
--             map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
--             auto_select = true, -- automatically select the first item
--             insert = false, -- use insert confirm behavior instead of replace
--             map_char = { -- modifies the function or method delimiter by filetypes
--             all = '(',
--             tex = '{'
--             }
--         })
--     end
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
    "ahmedkhalf/project.nvim",
    config = function()
    end
  }
  
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
    end
  }

  use {
    "jackguo380/vim-lsp-cxx-highlight",
    config = function()
    end
  }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup {
              signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
              numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
              linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
              word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            }
        end
    }
  
  use 'morhetz/gruvbox'
  
  use 'preservim/nerdtree'
  
  use 'kyazdani42/nvim-web-devicons'
  
  use 'tpope/vim-surround'
  
  use 'm-pilia/vim-ccls'
  
  use 'junegunn/vim-easy-align'

  use 'tmsvg/pear-tree'


end)

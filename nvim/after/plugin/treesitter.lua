
require'nvim-treesitter.configs'.setup {
  ensure_installed = {   },
  sync_install = false,
  auto_install = true,
  indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

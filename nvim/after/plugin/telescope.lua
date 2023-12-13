
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set('n', 'g?', builtin.help_tags, {})
vim.keymap.set('n', 'gf', builtin.find_files, {})
vim.keymap.set('n', 'gb', builtin.buffers, {})
vim.keymap.set('n', 'gS', builtin.grep_string, {})
vim.keymap.set('n', 'gs', builtin.live_grep, {})
vim.keymap.set('n', 'gj', builtin.jumplist, {})
vim.keymap.set('n', 'gt', function() vim.cmd("Telescope") end, {})


pcall(require('telescope').load_extension, 'fzf')


local builtin = require("telescope.builtin")
vim.keymap.set('n', 'gf', builtin.find_files, {})
vim.keymap.set('n', 'gb', builtin.buffers, {})
vim.keymap.set('n', 'gs', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)

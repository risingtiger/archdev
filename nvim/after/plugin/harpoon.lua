
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")


--require'harpoon'.setup {
--}

vim.keymap.set('n', 'ga', harpoon_mark.add_file)
vim.keymap.set('n', 'gh', harpoon_ui.toggle_quick_menu)
vim.keymap.set('n', 'g6', function() harpoon_ui.nav_file(1) end)
vim.keymap.set('n', 'g7', function() harpoon_ui.nav_file(2) end)
vim.keymap.set('n', 'g8', function() harpoon_ui.nav_file(3) end)
vim.keymap.set('n', 'g9', function() harpoon_ui.nav_file(4) end)
vim.keymap.set('n', 'g0', function() harpoon_ui.nav_file(5) end)


vim.keymap.set('n', 'g,', harpoon_ui.nav_prev)
vim.keymap.set('n', 'g.', harpoon_ui.nav_prev)

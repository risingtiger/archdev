
local function tada()
    local b = vim.api.nvim_buf_get_name(0)

    if string.find(b, 'nifty') then

        local dir = "/Users/dave/Code/nifty/"

        vim.cmd('wa')

        local buildstring = 'npm run build '

        if string.find(b, 'static/lazy/') then
            local lazy = string.match(b, '.+/([0-9a-zA-Z_-]+).+')
            buildstring = buildstring .. 'lazy-' .. lazy

        elseif string.find(b, 'static/') then
            buildstring = buildstring .. 'main'

        elseif string.find(b, 'appengine/') then
            buildstring = buildstring .. 'appengine'
        end

        vim.fn.jobstart(
            buildstring,
            {
                cwd = dir,
                on_exit = function() print(buildstring .. ' done') end,
                -- on_stdout = function(jobid, data) print(jobid, data) end,
                -- on_stderr = function(jobid, data) print(jobid, data) end,
            }
        )

    else
        print('nope')
    end
end


vim.g.mapleader = " "
vim.keymap.set("n", "gm", vim.cmd.Ex)

--move the selected line(s) up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--keep cursor in middle when jumping d or u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--allow search terms to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "]q", ":cn<CR>")
vim.keymap.set("n", "[q", ":cp<CR>")

vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>")

vim.keymap.set("n", "g<leader>", function() tada() end)




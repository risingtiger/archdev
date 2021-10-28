-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/xenition/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/xenition/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/xenition/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/xenition/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/xenition/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/opt/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\15signcolumn\1\14word_diff\1\nnumhl\1\vlinehl\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÖ\5\1\0\v\0/\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0003\t\v\0005\n\f\0B\a\3\2=\a\14\0069\a\n\0003\t\15\0005\n\16\0B\a\3\2=\a\17\0069\a\n\0009\a\18\a5\t\21\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\23\0069\a\n\0009\a\24\a5\t\25\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\26\0069\a\n\0009\a\18\a5\t\28\0009\n\19\0009\n\27\n=\n\22\tB\a\2\2=\a\29\0069\a\n\0009\a\24\a5\t\30\0009\n\19\0009\n\27\n=\n\22\tB\a\2\2=\a\31\0069\a\n\0009\a \a)\tüÿB\a\2\2=\a!\0069\a\n\0009\a \a)\t\4\0B\a\2\2=\a\"\0069\a\n\0009\a#\aB\a\1\2=\a$\0069\a\n\0009\a%\a5\t(\0009\n&\0009\n'\n=\n\22\tB\a\2\2=\a)\6=\6\n\0059\6*\0009\6+\0064\b\4\0005\t,\0>\t\1\b5\t-\0>\t\2\b5\t.\0>\t\3\bB\6\2\2=\6+\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-u>\n<C-d>\16scroll_docs\t<Up>\1\0\0\v<Down>\1\0\0\vSelect\n<C-p>\1\0\0\21select_prev_item\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pear-tree"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/pear-tree"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n`\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\2B\0\2\1K\0\1\0\15extensions\1\0\0\bfzf\1\0\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-ccls"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/vim-ccls"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-lsp-cxx-highlight"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/vim-lsp-cxx-highlight"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/xenition/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\2B\0\2\1K\0\1\0\15extensions\1\0\0\bfzf\1\0\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÅ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÖ\5\1\0\v\0/\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0003\t\v\0005\n\f\0B\a\3\2=\a\14\0069\a\n\0003\t\15\0005\n\16\0B\a\3\2=\a\17\0069\a\n\0009\a\18\a5\t\21\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\23\0069\a\n\0009\a\24\a5\t\25\0009\n\19\0009\n\20\n=\n\22\tB\a\2\2=\a\26\0069\a\n\0009\a\18\a5\t\28\0009\n\19\0009\n\27\n=\n\22\tB\a\2\2=\a\29\0069\a\n\0009\a\24\a5\t\30\0009\n\19\0009\n\27\n=\n\22\tB\a\2\2=\a\31\0069\a\n\0009\a \a)\tüÿB\a\2\2=\a!\0069\a\n\0009\a \a)\t\4\0B\a\2\2=\a\"\0069\a\n\0009\a#\aB\a\1\2=\a$\0069\a\n\0009\a%\a5\t(\0009\n&\0009\n'\n=\n\22\tB\a\2\2=\a)\6=\6\n\0059\6*\0009\6+\0064\b\4\0005\t,\0>\t\1\b5\t-\0>\t\2\b5\t.\0>\t\3\bB\6\2\2=\6+\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-u>\n<C-d>\16scroll_docs\t<Up>\1\0\0\v<Down>\1\0\0\vSelect\n<C-p>\1\0\0\21select_prev_item\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "friendly-snippets")
time([[Config for friendly-snippets]], false)
-- Config for: vim-lsp-cxx-highlight
time([[Config for vim-lsp-cxx-highlight]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-lsp-cxx-highlight")
time([[Config for vim-lsp-cxx-highlight]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\15signcolumn\1\14word_diff\1\nnumhl\1\vlinehl\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

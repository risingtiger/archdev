
local abs_path = "/Users/dave/Code/"
local nifty_path = "nifty/"
local client_path = nifty_path .. "client/"
local client_overrides_path = "chrome_overrides/localhost:"
local client_subfolder = "assets/"




local function trigger_copy_chrome_css_changes()

	local cmd = abs_path .. nifty_path .. 'buildit/buildit copy_chrome_css_changes '

	vim.fn.jobstart(cmd, {
		on_exit = function()
			vim.cmd('edit!')
			print("copy_chrome_css_changes done")
		end,
		on_stdout = append_data,
		on_stderr = append_data
	})
end




--[[
local function aideron()
	local f = vim.api.nvim_buf_get_name(0)
	vim.cmd("vsplit | term python -m aider " .. f)
end
--]]

--vim.keymap.set("n", "g;", aideron, { desc = "Aider Open" })



local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4

vim.opt.wrap = false

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.incsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

--vim.opt.termguicolors = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")


vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix Open" })

vim.keymap.set("n", "<leader>w", "<cmd>cp<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>cn<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

--[[
vim.keymap.set("n", "g<leader>", function()
	vim.cmd("wa")
end)

vim.keymap.set("n", "gm", function()
	vim.cmd("q")
end)
--]]

vim.keymap.set("n", "<leader>c", function()
	trigger_copy_chrome_css_changes()
end, { desc = "[C]ss update" })

vim.keymap.set("n", "gp", function()
	vim.cmd("ClangdSwitchSourceHeader")
end, { desc = "Toggle C Header File" })

map("x", "p", "P")



--[[
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--]]


vim.keymap.set("n", "GF", function()
	vim.cmd("e .")
end, { desc = "[F]iles viewer" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "H", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "gk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "gf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "gt", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "gs", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "gh", builtin.jumplist, { desc = "[S]earch [J]ump list" })
			vim.keymap.set("n", "GS", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "[D]iagnostic line open float" })
			vim.keymap.set("n", "<leader>dd", builtin.diagnostics, { desc = "[D]iagnostics all" })
			--vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			--vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "gb", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>s", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			--{ "jahui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("GD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					--map('......<leader>D......', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
					map("gv", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map("gvv", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					map("<leader>r", vim.lsp.buf.rename, "[R]ename")
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				cssls = {},
				clangd = {},
				ts_ls = {},
				rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					--{ name = "copilot", group_index = 0 },
					{ name = "lazydev", group_index = 0 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"csv",
				"diff",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"rust",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("gruvbox")
			vim.o.background = "light"
			vim.cmd.hi("Comment gui=none")
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"stevearc/aerial.nvim",
		keys = {
			{
				mode = "n",
				"g'",
				"<cmd>AerialToggle<CR>",
				desc = "[A]erial [T]oggle",
			},
		},
		config = function()
			require("aerial").setup({})
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		main = "harpoon",
		keys = {
			{
				"<leader>a",
				function()
					local harpoon = require("harpoon")
					harpoon:list():add()
				end,
				desc = "[H]arpoon [A]dd",
			},
			{
				"<leader>ah",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "[H]arpoon [L]ist",
			},
			{
				"<leader>au",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(1)
				end,
				desc = "[H]arpoon [S]elect 1",
			},
			{
				"<leader>ai",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(2)
				end,
				desc = "[H]arpoon [S]elect 2",
			},
			{
				"<leader>ao",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(3)
				end,
				desc = "[H]arpoon [S]elect 3",
			},
			{
				"<leader>ap",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(4)
				end,
				desc = "[H]arpoon [S]elect 4",
			},
			{
				"<leader>a[",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(0)
				end,
				desc = "[H]arpoon [S]elect 0",
			},
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup({})
		end,
	},

	--[[
	{
		"github/copilot.vim",
		event = "InsertEnter",
	},
	--]]

	{
		"sindrets/diffview.nvim",
	},

	{
		"echasnovski/mini.nvim",
		event = "InsertEnter",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.pairs").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},

	{
		"mfussenegger/nvim-lint",
		keys = {
			{
				"<leader>l",
				function()
					require("lint").try_lint()
				end,
				desc = "[L]int buffer",
			},
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
			}
		end,
	},

	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "n",
				desc = "[F]ormat buffer",
			},
		},

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			--vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},


	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<C-j>",
						dismiss = false,
					}
				}
				--[[
				suggestion = { enabled = false },
				panel      = { enabled = false },
				--]]
			})
		end,
	},

	--[[
	{
		"zbirenbaum/copilot-cmp",
		config = function ()
			require("copilot_cmp").setup()
			end
	},
	--]]

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "o1-preview",
				timeout = 120000, -- Timeout in milliseconds
				temperature = 1,
				max_tokens = 4096,
				["local"] = false,
			},
			mappings = {
				ask = "gj", -- ask
				edit = "gl", -- edit
				refresh = "<leader>j;", -- refresh
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	  },
	}
})




vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()

		local append_data = function(_, data)
			data = table.concat(data, '\n')
			print(data)
		end


		local client_dir = os.getenv("NIFTY_INSTANCE_CLIENT_DIR") or ""
		local server_dir = os.getenv("NIFTY_INSTANCE_SERVER_DIR") or ""

		local pwt_client_actual_dir = "/Users/dave/Code/pwt/client_pwt/"
		local xen_client_actual_dir = "/Users/dave/Code/xen/client_xen/"
		local pwt_server_actual_dir = "/Users/dave/Code/pwt/server_pwt/"
		local xen_server_actual_dir = "/Users/dave/Code/pwt/server_xen/"

		local filepath = vim.api.nvim_buf_get_name(0)
		local instance_client_pwt_str_index = string.find(filepath, pwt_client_actual_dir)
		local instance_server_pwt_str_index = string.find(filepath, pwt_server_actual_dir)
		local instance_client_xen_str_index = string.find(filepath, xen_client_actual_dir)
		local instance_server_xen_str_index = string.find(filepath, xen_server_actual_dir)

		local abs_filepath = ""

		if (instance_client_pwt_str_index) then
			abs_filepath = client_dir .. string.sub(filepath, instance_client_pwt_str_index+string.len(pwt_client_actual_dir))

		elseif (instance_server_pwt_str_index) then
			abs_filepath = server_dir .. string.sub(filepath, instance_server_pwt_str_index+string.len(pwt_server_actual_dir))

		elseif (instance_client_xen_str_index) then
			abs_filepath = client_dir .. string.sub(filepath, instance_client_xen_str_index+string.len(xen_client_actual_dir))

		elseif (instance_server_xen_str_index) then
			abs_filepath = server_dir .. string.sub(filepath, instance_server_xen_str_index+string.len(xen_server_actual_dir))

		else
			abs_filepath = filepath
		end

		local cmd = abs_path .. nifty_path .. 'buildit/buildit file '  .. abs_filepath

		vim.fn.jobstart(cmd, {
			on_exit = function()
				print("build process done")
			end,
			on_stdout = append_data,
			on_stderr = append_data
		})
	end
})











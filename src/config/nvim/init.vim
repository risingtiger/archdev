
syntax on
set hidden
set shortmess=a "This will use abbreviations for status messages to make lines shorter.
"set shortmess+=c
set splitright
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set smartindent "auto indent after pressing enter
set number "show line numbers
set relativenumber "show line numbers relative to focused line
set signcolumn=number
set nowrap
set incsearch "search as you type
set ignorecase "ignore case by default
set smartcase "pay attention to case if upper case character entered
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=300 "300 milliseconds. quick, so minimal lag
set termguicolors
set background=dark
set completeopt=menu,menuone,noselect
"set ruler
"filetype plugin on
"set shiftwidth=2


lua require('init')
lua require('plugins')


colorscheme gruvbox




let mapleader = " "

xmap ga  <Plug>(EasyAlign)
nnoremap <silent> ft <cmd>Telescope<cr>
nnoremap <silent> fi <cmd>Telescope find_files<cr>
nnoremap <silent> fh :Files ~/<CR>
nnoremap <silent> fm :NERDTreeToggle<CR>
nnoremap <silent> fb <cmd>Telescope buffers<cr>
nnoremap <silent> f<TAB> <C-w>w<CR>
nnoremap <silent> fs <cmd>Telescope live_grep<cr>
nnoremap <silent> fl :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR><CR>
nnoremap <silent> fr <cmd>Telescope grep_string<cr>
nnoremap <silent> fw :w<CR>
nnoremap <silent> fq :q<CR>
nnoremap <silent> fwa :wa<CR>
nnoremap <silent> fwq :wq<CR>
nnoremap <silent> fe :wa <bar> :e!<CR>
nnoremap <silent> fd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> fD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>
nnoremap <silent> <leader>p "0p
nnoremap <silent> <Leader>n :noh<CR>
nnoremap <silent> <Leader>C :set background=dark<CR>
nnoremap <silent> <Leader>c :set background=light<CR>
nnoremap <silent> <Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent> <Leader>J m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <Leader>K m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>
nnoremap <Leader>bn :wa<CR>:!cd ..; npm run dev;<CR>






syntax on
set hidden
set updatetime=250
set shortmess=a "This will use abbreviations for status messages to make lines shorter.
set splitright
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set smartindent "auto indent after pressing enter
set number "show line numbers
set relativenumber "show line numbers relative to focused line
set signcolumn=number
set nowrap
set incsearch "search as you type
set ignorecase "ignore case by default
set smartcase "pay attention to case if upper case character entered
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
set noswapfile
set nobackup
set undodir=~/.local/undodir
set undofile
set updatetime=300 "300 milliseconds. quick, so minimal lag
set termguicolors
set background=dark
set completeopt=menu,menuone,noselect


colorscheme gruvbox


lua require('init')
lua require('plugins')


let mapleader = " "

xmap ga  <Plug>(EasyAlign)
nnoremap <silent> ft <cmd>Telescope<CR>
nnoremap <silent> fi <cmd>Telescope fd<CR>
nnoremap <silent> fh :Files ~/<CR>
nnoremap <silent> fm :NERDTreeToggle<CR>
nnoremap <silent> fb <cmd>Telescope buffers<CR>
nnoremap <silent> f<TAB> <C-w>w<CR>
nnoremap <silent> fs <cmd>Telescope live_grep<CR>
nnoremap <silent> fl :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR><CR>
nnoremap <silent> fr <cmd>Telescope grep_string<CR>
nnoremap <silent> fw :w<CR>
nnoremap <silent> fq :q<CR>
nnoremap <silent> fwa :wa<CR>
nnoremap <silent> fwq :wq<CR>
nnoremap <silent> fe :wa <bar> :e!<CR>
nnoremap <silent> fR <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> fd <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> fD <cmd>Telescope lsp_declarations<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<CR>
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





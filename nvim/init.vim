
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
set foldmethod=syntax
set foldlevel=0
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
nnoremap <silent> fi <cmd>:Files<CR>
nnoremap <silent> fh :Files ~/<CR>
nnoremap <silent> fm :NERDTreeToggle<CR>
nnoremap <silent> fn :wa<CR>:!cd ..; npm run dev;<CR>
nnoremap <silent> fb <cmd>:Buffers<CR>
nnoremap <silent> f<TAB> <C-w>w<CR>
nnoremap <silent> fs <cmd>:Rg<CR>
nnoremap <silent> fl :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR><CR>
nnoremap <silent> fr :Rg <C-R><C-W><CR>
nnoremap <silent> fR <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> fd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> fD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> fk <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> fK <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> fw :w<CR>
nnoremap <silent> fq :q<CR>
nnoremap <silent> fwa :wa<CR>
nnoremap <silent> fwq :wq<CR>
nnoremap <silent> fe :wa <bar> :e!<CR>


nnoremap <silent> <Leader>cc :Commentary<CR>
xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<CR>
nnoremap <silent> <Leader>pp "0p
nnoremap <silent> <Leader>c gc<CR>
snoremap <silent> <Leader>c gc<CR>
nnoremap <silent> <Leader>n :noh<CR>
nnoremap <silent> <Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent> <Leader>J m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <Leader>K m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>





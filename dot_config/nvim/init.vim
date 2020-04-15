filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

  Plug 'junegunn/vim-plug'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'romainl/vim-cool'
  Plug 'tommcdo/vim-lion'
  Plug 'dylanaraps/wal.vim'

call plug#end()

" Plugin settings here

" various settings
set autoindent
set clipboard+=unnamedplus
set backspace=indent,eol,start
set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set noruler
set noshowmode
set wildmenu                  
set mouse=a
set number
set cmdheight=2
set scrolloff=5
set laststatus=0
set softtabstop=4
set undofile
set undodir=$HOME/.config/nvim/undodir
set undolevels=1000
set undoreload=10000


" mappings
nnoremap Y y$

nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>
nnoremap ,b :buffer *
nnoremap ,B :sbuffer *

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use <cr> to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" autocommands
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" colorscheme
colorscheme wal
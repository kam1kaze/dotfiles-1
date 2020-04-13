filetype plugin indent on
syntax on

if exists('*minpac#init')

  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('junegunn/vim-plug')
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('dense-analysis/ale')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('romainl/vim-cool')
  call minpac#add('tommcdo/vim-lion')
  call minpac#add('dylanaraps/wal.vim')

endif

" Plugin settings here

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()


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
set undodir=$HOME/.vim/undodir
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

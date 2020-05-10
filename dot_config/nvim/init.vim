filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'romainl/vim-cool'
  Plug 'dylanaraps/wal.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'lifepillar/vim-mucomplete'
  Plug 'neovim/nvim-lsp'
  Plug 'tweekmonster/startuptime.vim'

call plug#end()


" various settings
set clipboard+=unnamedplus
set backspace=indent,eol,start
set omnifunc=v:lua.vim.lsp.omnifunc
set hidden
set ignorecase
set smartcase
set noruler
set noshowmode
set noshowcmd
set mouse=a
set number
set wildcharm=<C-z>
set cmdheight=1
set scrolloff=5
set shortmess=at
set laststatus=0
set softtabstop=4
set undofile
set undodir=$HOME/.config/nvim/undodir
set completeopt+=menuone
set shortmess+=c
" set updatetime=100


" mappings
" Make Y work like D or C
nnoremap Y y$

" Buffer switching
nnoremap gb :buffer *

" Quick search/replace
nnoremap <Space>ip       :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space><Space>  :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Quick change
nnoremap cn /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap cN ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Better j and k
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


" autocommands
" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Disable auto commenting on newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically close preview window during completions
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif


" lua
:lua << EOF
  local nvim_lsp = require('nvim_lsp')
  nvim_lsp.pyls.setup{}
  require'nvim_lsp'.pyls.setup{}
EOF

let settings = {
          \   "pyls" : {
          \     "enable" : v:true,
          \     "trace" : { "server" : "verbose", },
          \     "commandPath" : "",
          \     "configurationSources" : [ "pycodestyle" ],
          \     "plugins" : {
          \       "jedi_completion" : { "enabled" : v:true, },
          \       "jedi_hover" : { "enabled" : v:true, },
          \       "jedi_references" : { "enabled" : v:true, },
          \       "jedi_signature_help" : { "enabled" : v:true, },
          \       "jedi_symbols" : {
          \         "enabled" : v:true,
          \         "all_scopes" : v:true,
          \       }}}}


" colorscheme
colorscheme wal

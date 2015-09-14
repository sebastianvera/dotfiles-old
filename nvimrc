let mapleader = " "

" Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'airblade/vim-gitgutter'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' } | Plug 'kana/vim-textobj-user'
Plug 'vim-scripts/matchit.zip'
Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'kurkale6ka/vim-pairs'
Plug 'w0ng/vim-hybrid'
Plug 'bling/vim-airline' | Plug 'paranoida/vim-airlineish'
Plug 'janko-m/vim-test', { 'for': 'ruby' }
call plug#end()

if shouldInstallBundles == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

" Vim Config
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

colorscheme hybrid

" General
set autoread
set autowrite
set number
set relativenumber
set noswapfile
set history=1000
set showcmd
set smarttab
set ttimeout
set ttimeoutlen=1
set timeoutlen=500
set incsearch
set laststatus=2
set wildmenu
set visualbell
set fileformats+=mac
set tabpagemax=50
set display+=lastline
set backspace=indent,eol,start
set nofoldenable
set nobackup
set splitright
"set splitbelow
set wildignore=*.o,*.obj,tmp,.git,node_modules,bower_components,build  

" Indendation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" Search
set gdefault
set ignorecase
set smartcase

" From sensible.vim 
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
set formatoptions+=j " Delete comment character when joining commented lines
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Mappings
inoremap <C-U> <C-G>u<C-U>
noremap <Leader>so :w<CR> :so ~/.nvimrc<CR>
noremap <Leader>vi :w<CR> :tabe ~/.nvimrc<CR>
noremap <Leader>pi :w<CR> :so ~/.nvimrc<CR> :PlugInstall<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <Leader>h :nohl<CR>

nnoremap <Leader><Leader> <C-^> 

nmap k gk
nmap j gj
map Q <Nop>
map K <Nop>

command! Q q

" tmux-runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30

" airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

" Neomake
let g:neomake_ruby_enabled_maker = ["rubocop"]
autocmd! BufWritePost * Neomake

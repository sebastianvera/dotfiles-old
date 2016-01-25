let mapleader = " "

" Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
let g:javascript_jsx_extensions = ['javascript', 'javascript.jsx', 'jsx']
Plug 'mxw/vim-jsx', { 'for': g:javascript_jsx_extensions } | Plug 'pangloss/vim-javascript', { 'for': g:javascript_jsx_extensions, 'branch': 'develop' }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': 'yes \| ./install.py --clang-completer --gocode-completer' }
Plug 'Raimondi/delimitMate' "must be before vim-endwise
Plug 'tpope/vim-endwise' "must be after delimitMate
Plug 'marijnh/tern_for_vim', { 'for': g:javascript_jsx_extensions, 'do': 'npm install' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'jgdavey/tslime.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile', 'Dockerfile'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
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
set background=dark
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

set list

if v:version > 703 || v:version == 703 && has('patch541')
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
noremap <Leader>so :w<CR> :so ~/.config/nvim/init.vim<CR>
noremap <Leader>vi :tabe ~/.config/nvim/init.vim<CR>
noremap <Leader>pi :w<CR> :so ~/.config/nvim/init.vim<CR> :PlugInstall<CR>
noremap <Leader>h :nohl<CR>
vnoremap <C-c> "*y

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
let g:vtr_filetype_runner_overrides = {
      \ 'go': 'go run {file}',
      \ }

" airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Neomake
autocmd! BufWritePost * Neomake

" vim-test
" let test#strategy = "vtr"
let test#strategy = "tslime"
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :TmuxNavigateRight<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsEditSplit = 'vertical'
" let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips', '~/.config/nvim/plugged/vim-snippets/snippets', '~/.config/nvim/vim-snippets/Ultisnips']
" let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" jsx
let g:jsx_ext_required = 0

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" go 
let g:go_fmt_command = 'goimports'
au FileType go nmap <Leader>gd <Plug>(go-doc)

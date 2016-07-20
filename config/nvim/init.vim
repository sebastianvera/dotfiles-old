let mapleader = " "

" Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
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
Plug 'wincent/terminus'
Plug 'kurkale6ka/vim-pairs'
Plug 'w0ng/vim-hybrid'
Plug 'bling/vim-airline'| Plug 'paranoida/vim-airlineish' | Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test', { 'for': ['ruby', 'javascript'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'sass'] }
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neoinclude.vim'
Plug 'Raimondi/delimitMate' "must be before vim-endwise
Plug 'tpope/vim-endwise' "must be after delimitMate
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'jgdavey/tslime.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile', 'Dockerfile'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
Plug 'acarapetis/vim-colors-github'
Plug 'junegunn/vim-easy-align'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/Colorizer'
Plug 'elubow/cql-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
call plug#end()

if shouldInstallBundles == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

" Vim Config
filetype plugin indent on
syntax enable

let g:python3_host_prog = '/usr/local/bin/python3'

" General
set autowrite
set noswapfile nowritebackup nobackup
set number relativenumber
set history=1000
set ttimeout ttimeoutlen=1 timeoutlen=500
set wildmenu wildmode=list:full
set wildignore=*.o,*.obj,tmp,.git,node_modules,bower_components,.DS_Store,build
set visualbell
set fileformats+=mac
set display+=lastline
set nofoldenable
set splitright splitbelow
set cursorline
set pumheight=10

" Indendation
set autoindent smarttab expandtab
set shiftround tabstop=2 shiftwidth=2
set pastetoggle=<F2>

" Search
set gdefault
set ignorecase smartcase

set list
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«,nbsp:¬
set scrolloff=1 sidescrolloff=5

colorscheme hybrid
set bg=dark
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0
" set bg=light

" Mappings

inoremap <C-U> <C-G>u<C-U>
noremap <Leader>so :w<CR> :so ~/.config/nvim/init.vim<CR>
noremap <Leader>vi :tabe ~/.config/nvim/init.vim<CR>
noremap <Leader>pi :w<CR> :so ~/.config/nvim/init.vim<CR> :PlugInstall<CR>
noremap <Leader>h :nohl<CR>
noremap <Leader>sp :UltiSnipsEdit<CR>
vnoremap <C-c> "*y

nnoremap <Leader><Leader> <C-^>

nmap k gk
nmap j gj
map Q <Nop>
map K <Nop>

command! Q q

" Do not show stupid q: window
map q: :q

" tmux-runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30
let g:vtr_filetype_runner_overrides = {
      \ 'go': 'go run {file}',
      \ 'php': 'hhvm {file}'
      \ }

" airline
let g:airline_theme = 'jaguirre'

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#syntastic#enabled = 0

let g:airline_mode_map = {
      \ '__' : '#',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V•L',
      \ 'c'  : 'C',
      \ "\026" : 'V•B',
      \ 's'  : 'S',
      \ 'S'  : 'S•L',
      \ "\023" : 'S•B',
      \ }
let g:airline#extensions#whitespace#symbol = ""

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_scss_enabled_checkers = ['scsslint']
" let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']

" vim-test
let test#strategy = "vtr"
" let test#strategy = "tslime"
let test#javascript#mocha#options='--compilers js:babel-register --require babel-polyfill'
" let test#javascript#mocha#executable = 'npm test'
"
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
let g:UltiSnipsSnippetDir='~/.config/nvim/UltiSnips'
" let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips', '~/.config/nvim/snippets']

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Fzf
nnoremap <C-p> :FZF<cr>

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" vim-jsx
let g:jsx_ext_required = 0

" Enable Emmet just for HTML/CSS/ERB
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby,eco,javascript.jsx,javascript,md EmmetInstall

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Allow project-specific `vimrc`s:
" http://andrew.stwrt.ca/posts/project-specific-vimrc/
set exrc

autocmd FileType ruby,javascript,javascript.jsx,css,scss,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc,.tern-project set ft=json

" json
let g:vim_json_syntax_conceal = 0

let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#input_patterns = {}

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

let g:webdevicons_enable_airline_statusline=0

" go
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-test)
au FileType go nmap <leader>s <Plug>(go-test-func)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go command! -bang A call go#alternate#Switch(<bang>0, '')
au FileType go command! -bang AV call go#alternate#Switch(0, "vsplit")
au FileType go command! -bang AS call go#alternate#Switch(0, "split")

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

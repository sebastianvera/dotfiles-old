let mapleader = " "

" Install vundle
let shouldInstallBundles = 0

if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let shouldInstallBundles = 1
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'
Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'wincent/terminus'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss', 'sass'] }
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neoinclude.vim'
Plug 'Raimondi/delimitMate' "must be before vim-endwise
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'jgdavey/tslime.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile', 'Dockerfile'] }
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'chrisbra/Colorizer'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'editorconfig/editorconfig-vim'
Plug 'othree/html5.vim'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
Plug 'andreypopp/vim-colors-plain'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': 'typescript' }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
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
set ruler
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
set nowrap
set inccommand=nosplit
set showcmd
set termguicolors

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

" colorscheme nord
colorscheme plain
set bg=dark

" Mappings
inoremap <C-U> <C-G>u<C-U>
noremap <Leader>so :w<CR> :so ~/.config/nvim/init.vim<CR>
noremap <Leader>vi :tabe ~/.config/nvim/init.vim<CR>
noremap <Leader>pi :w<CR> :so ~/.config/nvim/init.vim<CR> :PlugInstall<CR>
noremap <Leader>h :nohl<CR>
noremap <Leader>sp :UltiSnipsEdit<CR>
noremap <Leader>mp :Prettier<CR>
noremap <Leader>gb :Gblame<CR>
vnoremap <C-c> "*y
vnoremap // y/\V<C-R>"<CR>
vnoremap <silent> <Leader>ag y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

nnoremap <Leader><Leader> <C-^>

nmap k gk
nmap j gj
map Q <Nop>
" map K <Nop>

inoremap jk <Esc>

command! Q q
command! Qa qa

" Do not show stupid q: window
map q: :q

" tmux-runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30
let g:vtr_filetype_runner_overrides = {
      \ 'go': 'go run {file}',
      \ 'cpp': 'g++ {file} && ./{file}'
      \ }
nnoremap <silent> <leader>ap :VtrAttachToPane<CR>

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_scss_enabled_checkers = ['scsslint']

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
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Fzf
nnoremap <C-p> :FZF<cr>
nnoremap <leader>b :Buffers<cr>

" neomake
" Look for local eslint and if not use globally installed one
let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

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
autocmd FileType ruby,css,scss,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc,.tern-project set ft=json

" json
let g:vim_json_syntax_conceal = 0

" deoplete
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#input_patterns = {}

" echodoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" go
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-test)
au FileType go nmap <leader>s <Plug>(go-test-func)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go command! -bang A call go#alternate#Switch(<bang>0, '')
au FileType go command! -bang AV call go#alternate#Switch(0, "vsplit")
au FileType go command! -bang AS call go#alternate#Switch(0, "split")
au FileType go set colorcolumn=80

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

set statusline=""
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%{exists('g:loaded_fugitive')?'\ ':''}
set statusline+=%f\ [ASCII=\%03.3b]
set statusline+=[COL=\%c]

" Open file on last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" FZF
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Prettier
" Prettier configuration
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'

" nord
let g:nord_italic = 1
let g:nord_italic_comments = 1

" Javascript
au FileType javascript set tabstop=4 shiftwidth=4

" " Typescript
" autocmd FileType typescript,typescriptreact setl omnifunc=TSOmnicFunc
" " let g:neomake_typescript_enabled_makers = []
" let g:nvim_typescript#max_completion_detail=50
" let g:nvim_typescript#completion_mark=''
" let g:nvim_typescript#javascript_support=1
" " let g:nvim_typescript#diagnosticsEnable=1
" map <silent> <leader>gd :TSDoc <cr>
" map <silent> <leader>gt :TSType <cr>
" map <silent> <leader>gtd :TSTypeDef <cr>
" map <silent> <leader>ti :TSImport <cr>

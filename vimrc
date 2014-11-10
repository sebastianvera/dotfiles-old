" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible "Required by vundle
filetype off     "Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)!
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'ervandew/supertab'
Plugin 'wincent/Command-T'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'moll/vim-node'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'jgdavey/tslime.vim'
Plugin 'skwp/greplace.vim'
Plugin 'fatih/vim-go'
Plugin 'Raimondi/delimitMate'
Plugin 'jby/tmux.vim.git'
Plugin 'mattn/gist-vim'
" Needed for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" All of your Plugins must be added before the following line
call vundle#end() "required
filetype plugin indent on "required
" =====================================================
syntax on

let mapleader = ","
set t_Co=256
set autoindent
set autoread
set backspace=indent,eol,start
set et
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set hlsearch
set history=500
set ignorecase
set incsearch
set laststatus=2
set nofoldenable
set number
set relativenumber
set ruler
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartcase
set smarttab
set showmatch
set showcmd
set smartindent
set ts=2
set vb
set bg=dark

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

set timeoutlen=500


" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Color scheme
colorscheme default

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

nmap <leader>h :nohlsearch<cr>
nmap <leader>rd :Rake db:migrate<cr>
vmap <leader>a: :Tabularize /:<cr>
vmap <leader>a= :Tabularize /=<cr>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

command! Q q

map Q <Nop>
map K <Nop>

" Switch between the last two files
nnoremap <leader><leader> <c-^>
nmap <leader>k :NERDTreeToggle<cr>
inoremap <Tab> <C-P>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <Leader>gac :Gcommit -am ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>w <c-w>w
set completeopt=longest,menu
set complete=.,w,b,u,t
set wildmenu
set wildmode=list:full
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>gvi :tabe ~/.gvimrc<CR>
" Window navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
"
" " Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
noremap <F5> :CommandTFlush<CR>

fun! ExecuteFile()
  let l:rubycommand = "clear && ruby % \n"
  let l:command = substitute(l:rubycommand, "%", expand('%'), "")
  return l:command
endfun

nmap <Leader>e :call Send_to_Tmux(ExecuteFile())<CR>
" nmap <Leader>e :call Send_to_Tmux("r\nDebug.new.test\n")<cr>


" vim-rspec mappings
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" let g:rspec_command = 'call Send_to_Tmux("clear \n bin/rspec {spec}\n")'
" let g:rspec_command = '!bin/rspec {spec}'

nnoremap <Leader>r :w<cr>:call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :w<cr>:call RunNearestSpec()<CR>
nnoremap <Leader>l :w<cr>:call RunLastSpec()<CR>
nnoremap <Leader>a :w<cr>:call RunAllSpecs()<CR>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
map <Leader>t :CommandT<CR>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>m :Rmodel<cr>
map <Leader>mm :Rmodel 
map <Leader>c :Rcontroller<cr>
map <Leader>cc :Rcontroller 
map <Leader>u :Eunittest <cr>
map <Leader>uu :Eunittest 
map <Leader>rr :Rroutes<cr>

let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
command! RVroutes :vsp config/routes.rb

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set wildignore=*.o,*.obj,tmp,.git,node_modules,bower_components,build

" Stolen from r00k vimrc file
function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":vsp test/factories.rb"
  else
    execute ":vsp spec/factories.rb"
  end
endfunction

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

if has("gui_running") 
  " Don't add the comment prefix when I hit enter or o/O on a comment line.
  set formatoptions-=or

  " No toolbar
  set guioptions-=T

  " Use console dialogs
  set guioptions+=c

  colorscheme solarized
  set guifont=Monaco\ for\ Powerline:h14
  set bg=dark
endif
" ========================================================================
" End of things set by me.
" ========================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify
        \ it_should_behave_like before after setup subject its shared_examples_for shared_context expect let
  highlight def link rubyRspec Function

  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  augroup END

endif " has("autocmd")

" Go Stuff
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

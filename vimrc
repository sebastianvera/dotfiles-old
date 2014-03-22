" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tpope/vim-rails'
Bundle 'danro/rename.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rvm'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-matchit'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tomtom/tcomment_vim'
Bundle 'thoughtbot/vim-rspec'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-repeat'
Bundle 'digitaltoad/vim-jade'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle "mattn/emmet-vim"
Bundle 'moll/vim-node'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'bling/vim-airline'
Bundle 'paranoida/vim-airlineish'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'

syntax on
filetype plugin indent on

let mapleader = ","
set t_Co=256
set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=80
set et
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set gdefault
set hlsearch
set history=500
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅
set nocompatible
set nofoldenable
set relativenumber
set ruler
set shiftwidth=2
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

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Color scheme
colorscheme default 

if has("gui_running")
  colorscheme solarized

  set guifont=Monaco\ for\ Powerline:h14
  set bg=dark
endif
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

nmap <leader>h :nohlsearch<cr>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

command! Q q

" Switch between the last two files
nnoremap <leader><leader> <c-^>
nmap <leader>k :NERDTreeToggle<cr>
inoremap <Tab> <C-P>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <Leader>gac :Gcommit -am ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>w <c-w>w
set completeopt=longest,menu
set complete=.,w,b,u,t
set wildmode=longest,list:longest
map <Leader>vi :tabe ~/.vimrc<CR>
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

" vim-rspec mappings
nnoremap <Leader>r :w<cr>:call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :w<cr>:call RunNearestSpec()<CR>
nnoremap <Leader>l :w<cr>:call RunLastSpec()<CR>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
map <Leader>t :CommandT<CR>
map <Leader>f :call OpenFactoryFile()<CR>

let g:rspec_command = "!clear && zeus rspec {spec}"
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
command! RVroutes :vsp config/routes.rb

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Stolen from r00k vimrc file
function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":vsp test/factories.rb"
  else
    execute ":vsp spec/factories.rb"
  end
endfunction

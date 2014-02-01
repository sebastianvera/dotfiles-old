" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rvm'
Bundle 'wincent/Command-T'
"Bundle 'croaky/vim-colors-github'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-matchit'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tcomment_vim'
Bundle 'thoughtbot/vim-rspec'

syntax on
filetype plugin indent on

let mapleader = ","
set t_Co=256
set autoindent
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
set bg=light

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
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

nmap <leader>h :nohlsearch<cr>

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

" Switch between the last two files
nnoremap <leader><leader> <c-^>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
"
" " Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>r :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
map <Leader>t :CommandT<CR>
let g:rspec_command = "!zeus rspec {spec}"
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

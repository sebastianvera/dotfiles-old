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
Plugin 'Raimondi/delimitMate'
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
Plugin 'jby/tmux.vim.git'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/molokai'
Plugin 'burnettk/vim-angular'
Plugin 'mxw/vim-jsx'
Plugin 'majutsushi/tagbar'
Plugin 'ap/vim-css-color'
Plugin 'w0ng/vim-hybrid'

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

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't   create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autowrite                   " Automatically save before :next, :make etc.

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

set timeoutlen=500
set pastetoggle=<F2>

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Color scheme
" let g:molokai_original=1
" colorscheme molokai
colorscheme default

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

nmap <leader>h :nohlsearch<cr>
nmap <leader>rd :Rake db:migrate<cr>
vmap <leader>a: :Tabularize /:<cr>
vmap <leader>a= :Tabularize /=<cr>

nmap k gk
nmap j gj

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

command! Q q

map Q <Nop>
map K <Nop>

" Switch between the last two files
nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader>z :Goyo<cr>
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

noremap <F5> :CommandTFlush<CR>

" " Get off my lawn
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>


fun! ExecuteFile()
  let l:rubycommand = "clear && ruby % \n"
  let l:command = substitute(l:rubycommand, "%", expand('%'), "")
  return l:command
endfun

" nmap <Leader>e :!clear && python %<cr>
" nmap <Leader>e :!clear && node /Users/svera/Code/fipres/test.js<cr>
" nmap <Leader>e :!clear && ruby %<cr>
" nmap <Leader>e :!clang++ -stdlib=libc++ -std=gnu++11 % -o a && clear && ./a < %.input<cr>
" nmap <Leader>e :!clear && node %<cr>
nmap <Leader>e :call Send_to_Tmux("clear && python predict.py 494f27e7029cff9092c6fbd5caaef09f892c6ab105cb9311 -s 2015-01-01 -e 2015-03-31 -m linear -g monthly\n")<CR>
" nmap <Leader>e :call Send_to_Tmux("clear && node lib/main.js\n")<CR>
" nmap <Leader>e :call Send_to_Tmux(ExecuteFile())<CR>
" nmap <Leader>e :call Send_to_Tmux("r\nDebug.new.test\n")<cr>


" vim-rspec mappings
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" let g:rspec_command = 'call Send_to_Tmux("clear \n bin/rspec {spec}\n")'
" let g:rspec_command = '!bin/rspec {spec}'

nnoremap <Leader>r :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
map <Leader>t :CommandT<CR>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>m :Emodel<cr>
map <Leader>mm :Emodel 
map <Leader>c :Econtroller<cr>
map <Leader>cc :Econtroller 
map <Leader>u :Eunittest <cr>
map <Leader>uu :Eunittest 
map <Leader>rr :Einitializer<cr>

let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
"Others airline themes: bubblegum, airlineish

command! RTroutes :tabe config/routes.rb
command! RVroutes :vsp config/routes.rb

" Don't add the comment prefix when I hit enter or o/O on a comment line.
"
set formatoptions-=or

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set wildignore=*.o,*.obj,tmp,.git,node_modules,bower_components,build

" Stolen from r00k vimrc file
function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":tabnew test/factories.rb"
  else
    execute ":tabnew spec/factories.rb"
  end
endfunction

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_ruby_checkers = ["rubocop"]
" let g:syntastic_javascript_checkers = ['eslint']

if has("gui_running") 
  " Don't add the comment prefix when I hit enter or o/O on a comment line.
  set formatoptions-=or
  set vb t_vb=

  set guioptions-=m  "no menu
  set guioptions-=T  "no toolbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r  "no scrollbar
  set guioptions-=R

  let macvim_skip_colorscheme=1
  let g:molokai_original=1
  colorscheme hybrid
  highlight SignColumn guibg=#272822



  " Use console dialogs
  set guioptions+=c

  " colorscheme solarized
  set guifont=Monaco\ for\ Powerline:h14
  " set bg=dark
  
  " let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
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

" ==================== NerdTree ====================
" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
  if g:NERDTree.IsOpen()
    exec 'NERDTreeClose'
  else
    exec 'NERDTreeFind'
  endif
endfunction

" For toggling
noremap <Leader>k :<C-u>call g:NerdTreeFindToggle()<cr> 

" ==================== DelimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" ==================== YouCompleteMe ====================
let ycm_autoclose_preview_window_after_completion = 1
let ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


" Go Stuff
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tt <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" ==================== UltiSnips ====================

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Javascript
let g:used_javascript_libs = 'jquery,underscore,angularjs'

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

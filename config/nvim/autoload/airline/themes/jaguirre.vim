" autoload/airline/themes/jaguirre.vim
let g:airline#themes#jaguirre#palette = {}

" Cool colors:
"  '#00005f'
"  '#dfff00'
"  '#9cffd3'

let s:N1   = [ '#313338' , '#BEDC81' ,  17  , 190, 'bold' ]
let s:N2   = [ '#313338' , '#D9FF8C' , 255 , 238, 'bold' ]
let s:N3   = [ '#D9FF8C' , '#1C3033' , 85  , 234 ]

let s:NM1   = [ '#313338' , '#F97F59' , 255 , 238, 'bold' ]
let s:NM2   = [ '#313338' , '#FF8660' , 255 , 238, 'bold' ]
let s:NM3   = [ '#D9FF8C' , '#1C3033' , 85  , 234 ]

let s:warning_area = ['#FFFFFF', '#DB4353', 232, 92, 'bold']

let g:airline#themes#jaguirre#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#jaguirre#palette.normal.airline_warning = s:warning_area
let g:airline#themes#jaguirre#palette.normal_modified = airline#themes#generate_color_map(s:NM1, s:NM2, s:NM3)
let g:airline#themes#jaguirre#palette.normal_modified.airline_warning = s:warning_area

let g:airline#themes#jaguirre#palette.insert = copy(g:airline#themes#jaguirre#palette.normal)
let g:airline#themes#jaguirre#palette.insert_modified = g:airline#themes#jaguirre#palette.normal_modified
let g:airline#themes#jaguirre#palette.insert_paste = g:airline#themes#jaguirre#palette.normal_modified

let g:airline#themes#jaguirre#palette.insert.airline_warning = s:warning_area
let g:airline#themes#jaguirre#palette.insert_modified.airline_warning = s:warning_area
let g:airline#themes#jaguirre#palette.insert_paste.airline_warning = s:warning_area

let g:airline#themes#jaguirre#palette.replace = copy(g:airline#themes#jaguirre#palette.insert)
let g:airline#themes#jaguirre#palette.replace_modified = g:airline#themes#jaguirre#palette.insert_modified

let g:airline#themes#jaguirre#palette.visual = copy(g:airline#themes#jaguirre#palette.insert)


let s:IA1 = [ '#CCCCCC' , '#262626' , 239 , 234 , '' ]
let s:IA2 = [ '#AAAAAA' , '#4e4e4e' , 239 , 235 , '' ]
let s:IA3 = [ '#CCCCCC' , '#2f3f3f' , 239 , 236 , '' ]
let g:airline#themes#jaguirre#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#jaguirre#palette.inactive_modified = {
      \ 'airline_c': [ '#875faf' , '' , 97 , '' , '' ] ,
      \ }

let g:airline#themes#jaguirre#palette.accents = {
      \ 'red': [ '#DB4353' , '' , 160 , ''  ]
      \ }

" Convenience functions
function! s:check_defined(variable, default)
  if !exists(a:variable)
    let {a:variable} = a:default
  endif
endfunction

function! AirlineDevicon()
  return WebDevIconsGetFileTypeSymbol() . ' ' . &ft
endfunction

function! ReadOnly()
  if &readonly && &modifiable && !filereadable(bufname('%'))
    return '[noperm]'
  else
    return &readonly ? ' ' : ''
  endif
endfunction

function! ProjectFilepath() " {{{
    let l:path = fnamemodify(expand('%'), ':p:h')
    let l:root = getcwd()
    let l:root = substitute(l:path, '^' . l:root . '/', '', '')
    let l:root = substitute(l:root, '^' . $HOME, '~', '')
    if exists('b:git_dir')
      let l:git_dir = substitute(b:git_dir, '^' . $HOME, '~', '')
      let l:git_dir = substitute(l:git_dir, '/.git' . '$', '', '')

      let l:project = "  " . fnamemodify(b:git_dir, ':h:t')
      let l:root = substitute(l:root, '^' . b:git_dir, '', '')

      if l:git_dir == l:root
        let l:root = l:project
      else
        let l:root .= l:project
      endif
    endif
    return l:root
endfunction

" Symbols
call s:check_defined('g:airline_symbols', {})
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = "●"
let g:airline_symbols.branch = ""
let g:airline_symbols.readonly = ""
let g:airline_symbols.modified = ""
let g:airline_symbols.linenr = ""
let g:airline_symbols.colnr = ""

" Parts
call airline#parts#define_raw('file_percentage', '%p%%')
call airline#parts#define_raw('linenr', '%{g:airline_symbols.linenr}%l')
call airline#parts#define_raw('colnr', '%v')
call airline#parts#define('readonly', {
      \ 'function': 'airline#parts#readonly',
      \ 'accent': 'red',
      \ })
call airline#parts#define_raw('file', "%t")
call airline#parts#define_raw('filepath', '%{ProjectFilepath()} ')
call airline#parts#define_raw('fformat', "%{&ff == 'unix' ? '' : WebDevIconsGetFileFormatSymbol()}%{&fenc == 'utf-8' ? '' : ' ' . &fenc}")
call airline#parts#define('devicon', {
      \ 'function': 'AirlineDevicon',
      \ 'accent': 'bold',
      \ })

call airline#parts#define_function('readonly', 'ReadOnly')
" Sections
let g:airline_section_a = airline#section#create(['mode', 'paste'])
let g:airline_section_b = airline#section#create(['branch'])
let g:airline_section_c = airline#section#create(['%<', 'filepath', 'readonly', " " , 'file'])
let g:airline_section_z = airline#section#create(['linenr' , ':' , 'colnr'])
let g:airline_section_x = airline#section#create(['tagbar', 'fformat'])
let g:airline_section_y = airline#section#create(['devicon'])

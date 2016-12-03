" .vimrc v1.0
" Vim configuration file
"

" Modifications:
" (1.00) Kent - Creation

" Todo:
" Integrate cscope

syntax on
set background=dark
set title                   " Show filename in titlebar
set number                  " Enable line numbers
set numberwidth=5           " Set width for line numbers
set cursorline              " Highligh current line

set autoindent              " Enable auto-indent
set expandtab               " Use spaces instead of tabs
set tabstop=4               " Make tabs as wide as 4 spaces
set shiftwidth=4            " Set number of spaces inserted for indentation
set encoding=utf-8 nobomb   " Use UTF-8 wo BOM

set visualbell noerrorbells " Don't beep
set gdefault                " Global replace always
set nowrap                  " Don't wrap lines

set paste
set backspace=indent,eol,start

" Set statusline format
set laststatus=2
set statusline=
set statusline +=%{&ff}%*   "file format
set statusline +=%y%*       "file type
set statusline +=%f%*       "full path
set statusline +=%=%5l%*    "current line
set statusline +=/%L%*      "total lines
set statusline +=%4v\ %*    "virtual column number
set statusline +=0x%04B\ %* "character under cursor

" Global CTags
:nnoremap <C-]> g<C-]>

" Remove trailing whitespaces
function Rmspaces()
    %s/\s\+$//
endfunction

" Show function name (For C files only)
function Showfuncname()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction
map f :call Showfuncname() <CR>

" Set to javascript dev mode (2 spaces for indention)
function Jsdev()
  set tabstop=2               " Make tabs as wide as 2 spaces
  set shiftwidth=2            " Set number of spaces inserted for indentation
endfunction

" Set to normal dev mode (4 spaces for indention)
function Normaldev()
  set tabstop=4               " Make tabs as wide as 4 spaces
  set shiftwidth=4            " Set number of spaces inserted for indentation
endfunction
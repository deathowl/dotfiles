set nocompatible
filetype off
set backspace=indent,eol,start

syntax on
filetype plugin indent on
let mapleader = "."

"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"set statusline+=%{fugitive#statusline()}


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

 nmap :ed :edit %:p:h/
"
let g:ctrlp_max_files=20000  " Limit number of cached files


" specify hidden directories
"

nnoremap j gj
nnoremap k gk

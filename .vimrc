set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/zsh
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
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

nmap <C-d> :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" specify hidden directories
"

nnoremap j gj
nnoremap k gk
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0 " TODO
let g:airline_theme = "hybridline"              " Powerline Like color Scheme for Airline

function! AirlineInit()
  " Available options: mode, branch, %f, ffenc, hunks, %l, %c, filetype
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create_left([])
  let g:airline_section_c = airline#section#create(['%f'])
  let g:airline_section_x = airline#section#create(['ffenc'])
  let g:airline_section_y = airline#section#create(['hunks'])
  let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction

autocmd VimEnter * call AirlineInit()

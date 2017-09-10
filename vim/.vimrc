set nocompatible
filetype on
filetype plugin on
filetype indent on

" General Settings
syntax on

set t_Co=256
set number " show line numbers
set showmatch

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Airline plugin
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" Python settings
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

let python_highlight_all=1


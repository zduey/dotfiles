set nocompatible

" General Settings
syntax on

set t_Co=256
set showmatch
set relativenumber
set showmatch
set expandtab
set autoindent
set fileformat=unix


set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Airline plugin
set laststatus=2
let g:airline_solarized_bg='dark'
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" Python settings
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79

let python_highlight_all=1

au BufNewFile, BufRead *.c
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79

" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>

" Start nerdtree by default
autocmd vimenter * NERDTree

" Open NERDTree automatically when vim starts and no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close NERDTree if it is the only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

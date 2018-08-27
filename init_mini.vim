syntax enable

filetype plugin indent on
filetype plugin on
" by default, the indent is 2 spaces. 
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for python files, 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

:inoremap jj <Esc>
:inoremap <C-e> <Esc>A
:inoremap <C-a> <Esc>I
" highlight LineNr ctermfg=grey

" colorscheme base16-eighties

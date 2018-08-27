syntax enable
set background=dark
" by default, the indent is 2 spaces. 
filetype plugin indent on
filetype plugin on
set tabstop=2
set shiftwidth=2
set expandtab
" set guifont=Source\ Code\ Pro:h14
" highlight searched keyword
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" place a line at 80th column
set cc=80

" use system clipboard
set clipboard=unnamed

" split window in a natural way: below / right
set splitbelow
set splitright
" for python files, 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
:inoremap jj <Esc>
set number
"highlight LineNr ctermfg=grey

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
" Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'lervag/vimtex'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
call plug#end()

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" deoplete + neosnippet + autopairs changes 
let g:AutoPairsMapCR=0 
let g:deoplete#auto_complete_start_length = 1 
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 
" NeoSnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
      \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_jump_or_expand)

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" show line numbers in relative to current line
set number relativenumber
" unselected buffers show absolute line number,
" and selected buffer shows hybrid line number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

colorscheme base16-eighties
" patch issue of using >
autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">

" Use vim settings instead of Vi settings
set nocompatible

" Show what you are typing as a command.
set showcmd

" Folding (http://www.linux.com/learn/tutorials/442438-vim-tips-folding-fun)
set foldmethod=marker

" Add line number
set number

" Highlight search matches
set hlsearch

" Display long lines as just one line
set nowrap

" Ignoring case when searching
set ignorecase

" Synthax highlighting
syntax enable

" Highlight current line
set cursorline

" Turn cursorline off when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Incremental search
set incsearch 

"This actually loads the file ftplugin.vim in runtimepath.
"The result is that when a file is edited its plugin file is loaded
"(if there is one for the detected filetype)
filetype plugin on

" convert tabs to spaces
if has("autocmd")
    au BufReadPost * if &modifiable | retab | endif
endif 

" Indentation
set autoindent      " set the cursor at same indent as line above
set smartindent     " try to be smart about indenting (C-style)

set tabstop=4       " changes the width of the TAB character
set shiftwidth=4    " affects what happens when pressing >> or <<
set softtabstop=4   " with expandtab enabled, allows deleting 4 spaces
set expandtab       " turns TAB into 4 spaces

" This actually loads the file indent.vim in 'runtimepath'.
" The result is that when a file is edited its indent file is loaded 
" (if there is one for the detected filetype).
filetype indent on

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Pathogen
execute pathogen#infect()

" Gruvbox (https://github.com/morhetz/gruvbox) theme
set background=dark
colorscheme gruvbox

if !has("gui_running")
   let g:gruvbox_italic=0
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable arrow keys in both modes
inoremap <up> <nop>
noremap <up> <nop>
inoremap <down> <nop>
noremap <down> <nop>
inoremap <left> <nop>
noremap <left> <nop>
inoremap <right> <nop>
noremap <right> <nop>

" Curly brace + enter key = proper indentation 
inoremap {<CR> {<CR>}<C-o>O

" Windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
noremap gn :bn<cr>
noremap gp :bp<cr>
noremap gd :bd<cr>

" Avoid scrolling when switching buffers
if v:version >= 700
    au BufLeave * if !&diff | let b:winview = winsaveview() | endif
    au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
endif

" Stop indenting when pasting with the mouse
set pastetoggle=<F5>

" Turn on comment spell checking
set spell

" Syntastic options
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = '-std=c++0x'

"" Display status line
set laststatus=2

" NERDTree ignores all object files
let NERDTreeIgnore = ['\.o$']

" js-beautify
map <c-f> :call JsBeautify()<cr>

" remove toolbar in gvim
set guioptions -=T

" remove right scrollbar
set guioptions -=r

" remove left scrollbar
set guioptions -=L

" break search after reaching last found item 
set nowrapscan

" set leader key to ,
let mapleader=","

" Goyo shortcut
nnoremap <silent> <leader>z :Goyo<cr>

" configure Goyo
let g:goyo_width=140
let g:goyo_margin_top=3
let g:goyo_margin_bottom=3

" Disable markdown highlight 
autocmd VimEnter * highlight clear htmlItalic

" Enable syntax highlighting for .md files
au BufRead,BufNewFile *.md set filetype=markdown

" Integrate vim-airline with previously installed powerline fonts
" Patched powerline fonts fix triangle character alignment problems
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" Unicode encoding
set encoding=utf-8
scriptencoding utf-8

" Super efficient shortcut
nnoremap ; :
nnoremap : <NOP>

" Leave insert mode
inoremap jk <ESC>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+"

" CtrlP
let g:ctrlp_custom_ignore = {
    \ 'file': '\.a$\|\.o$' }

" Mappings
:noremap <F2> :!xelatex %<CR>

" Counting words in LaTeX documents
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction
command WC call WC()

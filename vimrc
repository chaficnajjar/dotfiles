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

" Display status line
set statusline=2

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Pathogen
execute pathogen#infect()

" Solarized theme
set background=dark
colorscheme solarized

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Tab label will show even if only one file is opened
set showtabline=2

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
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Stop indenting when pasting with the mouse
set pastetoggle=<F5>

" Turn on comment spell checking
set spell

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = '-std=c++0x'

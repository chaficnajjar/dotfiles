" Turn hybrid line numbers on (see https://jeffkreeftmeijer.com/vim-number/).
set number relativenumber

" Display long lines as just one line
set nowrap

" Ignoring case when searching
set ignorecase

" Highlight current line
set cursorline

" Turn cursorline off when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Incremental search
set incsearch

" Convert tabs to spaces.
if @% != ".gitconfig" && @% != "gitconfig"
  au BufReadPost * if &modifiable | retab | endif
endif

" Indentation
set autoindent      " set the cursor at same indent as line above
set smartindent     " try to be smart about indenting (C-style)

set tabstop=2       " changes the width of the TAB character
set shiftwidth=2    " affects what happens when pressing >> or <<
set softtabstop=2   " with expandtab enabled, allows deleting 2 spaces
if @% != ".gitconfig" && @% != "gitconfig"
  set expandtab   " turns TAB into 2 spaces
endif

" Automatic back up
set backupdir=~/.backup/backup//
set directory=~/.backup/swap//
set undodir=~/.backup/undo//

" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/suda.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'will133/vim-dirdiff'
Plug 'w0rp/ale'

call plug#end()

" Gruvbox (https://github.com/morhetz/gruvbox) theme
colorscheme gruvbox

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

"" Display status line
set laststatus=2

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

" CtrlP: ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Compilation shortcuts
autocmd FileType tex noremap <F2> :!xelatex %<CR>

" Beautify.
autocmd FileType json noremap <F3> :%!python -m json.tool<cr>
au BufNewFile,BufRead *.geojson set filetype=geojson
autocmd FileType geojson noremap <F3> :%!python -m json.tool<cr>
autocmd FileType javascript noremap <F3> :call JsBeautify()<cr>
autocmd FileType css noremap <F3> :call CSSBeautify()<cr>
autocmd FileType html,svg noremap <F3> :call HtmlBeautify()<cr>

" Remove trailing whitespace.
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w suda://%

" Automatically refresh Vim on buffer/window focus.
autocmd FocusGained * checktime

let b:ale_linters = ['eslint']
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '✘'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' }
\}

" Move line up one line.
nnoremap <S-k> :m-2<CR>

" Move line down one line.
nnoremap <S-j> :m+<CR>

" Move selected lines up one line.
xnoremap <S-k> :m-2<CR>gv=gv

" Move selected lines down one line.
xnoremap <S-j> :m'>+<CR>gv=gv

" Set syntax highlighting of *.snap.js files to JavaScript.
autocmd BufNewFile,BufRead *.js.snap set syntax=javascript

" See https://github.com/neoclide/coc.nvim#example-vim-configuration and https://medium.com/usevim/vim-101-set-hidden-f78800142855.
set hidden

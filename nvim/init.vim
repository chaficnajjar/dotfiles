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

" Try to be smart about indenting (C-style).
set smartindent

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
Plug 'gruvbox-community/gruvbox'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/suda.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pantharshit00/vim-prisma'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'will133/vim-dirdiff'

call plug#end()

" Gruvbox (https://github.com/morhetz/gruvbox) theme
colorscheme gruvbox

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Curly brace + enter key = proper indentation
inoremap {<CR> {<CR>}<C-o>O

" Buffer navigation
noremap gn :bn<CR>
noremap gp :bp<CR>
noremap gd :bd<CR>

" break search after reaching last found item
set nowrapscan

" set leader key to ,
let mapleader=","

" Goyo shortcut
nnoremap <silent> <leader>z :Goyo<CR>

" configure Goyo
let g:goyo_width=140
let g:goyo_margin_top=3
let g:goyo_margin_bottom=3

" Disable markdown highlight
autocmd VimEnter * highlight clear htmlItalic

" Enable syntax highlighting for .md files
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Integrate vim-airline with previously installed powerline fonts
" Patched powerline fonts fix triangle character alignment problems
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

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
autocmd FileType json noremap <F3> :%!python -m json.tool<CR>
autocmd BufNewFile,BufRead *.geojson set filetype=geojson
autocmd FileType geojson noremap <F3> :%!python -m json.tool<CR>
autocmd FileType javascript noremap <F3> :call JsBeautify()<CR>
autocmd FileType css noremap <F3> :call CSSBeautify()<CR>
autocmd FileType html,svg noremap <F3> :call HtmlBeautify()<CR>

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w suda://%

" Automatically refresh Vim on buffer/window focus.
autocmd FocusGained * checktime

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

highlight CocErrorSign ctermfg=red
highlight CocWarningSign ctermfg=yellow
highlight CocErrorHighlight cterm=undercurl guisp=#fb4934
highlight CocWarningHighlight cterm=undercurl guisp=#fabd2f

" Ctrl + l = show documentation in preview window.
" Solution taken from https://github.com/neoclide/coc.nvim/issues/869#issuecomment-501323697.
nnoremap <silent> <C-l> :call CocAction('doHover')<CR>

" Ctrl + h = to trigger TypeScript completion.
inoremap <silent><expr> <C-h> coc#refresh()

" Ctrl + k = go to next error or warning.
" Ctrl + j = go to previous error or warning.
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Prettier configuration taken from https://github.com/neoclide/coc-prettier/blob/master/Readme.md#usage.
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

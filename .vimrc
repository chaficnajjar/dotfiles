" Use vim settings instead of Vi settings
set nocompatible

" Adds line numbers
set number

" Highlighting search matches
set hlsearch

" Synthax highlighting
syntax enable

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

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

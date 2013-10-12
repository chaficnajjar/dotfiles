set number

syntax on
filetype plugin indent on

execute pathogen#infect()

set background=dark
colorscheme solarized

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

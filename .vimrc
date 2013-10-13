" Adds line numbers
set number

" Synthax highlighting 
syntax enable

" Pathogen
execute pathogen#infect()

" Solarized theme
set background=dark
colorscheme solarized

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

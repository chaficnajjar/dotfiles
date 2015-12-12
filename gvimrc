set gfn=Source\ Code\ Pro\ for\ Powerline\ Medium\ 9
:autocmd BufNewFile,BufRead * :cd %:p:h

" Remove toolbar in gvim.
set guioptions -=T

" Remove right scrollbar.
set guioptions -=r

" Remove left scrollbar.
set guioptions -=L

" Remove menu bar.
:set guioptions-=m

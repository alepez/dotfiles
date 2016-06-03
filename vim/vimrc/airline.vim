" the theme
let g:airline_theme='pez' " Sometime this does not work... why?
au VimEnter * AirlineTheme pez " Fix for the above

" always show statusbar
set laststatus=2

" Enable the list of buffers (statusline, bottom)
let g:airline#extensions#bufferline#enabled = 1

" Enable the list of tabs (tabline, top)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Enable syntastic
let g:airline#extensions#syntastic#enabled = 1

" Disable echo of current buffer in commandline
let g:bufferline_echo = 0

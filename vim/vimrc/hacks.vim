"---------- Always show the sign (also called gutter) {{{
augroup AlwaysShowTheSign
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END
" }}}

"---------- Silently execute external commands, without needing to redraw {{{
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
" }}}

" Disable Ex mode
:map Q <Nop>

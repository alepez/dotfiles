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

"---------- cmdheight {{{
function! ResizeCmdHeight()
  if &columns < 120
    set cmdheight=2
  else
    set cmdheight=1
  endif
endfunction

" neovim size is 80 when vimrc is sourced. So we need to resize on VimEnter
augroup ResizeCmdOnVimEnterOrResized
    autocmd!
    autocmd VimEnter * call ResizeCmdHeight()
    autocmd VimResized * call ResizeCmdHeight()
augroup END
" }}}

" short messages, avoid annoying Hit ENTER to continue in some cases
set shortmess=a

" Disable Ex mode
:map Q <Nop>

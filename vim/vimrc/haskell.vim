"" Good for haskell, but also for cpp
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0

" Indenting on save is too aggressive for me
let g:hindent_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>af :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>ag :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>agg :call HaskellFormat('both')<CR>
augroup END

augroup hdevtools
  au!
  au FileType haskell nnoremap <leader>yt :HdevtoolsType<CR>
  au FileType haskell nnoremap <leader>yi :HdevtoolsInfo<CR>
  au FileType haskell nnoremap <leader>yc :HdevtoolsClear<CR>
augroup END

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_use_stack = 1

augroup necoghc
  au!
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

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

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>af :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>ag :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>agg :call HaskellFormat('both')<CR>
augroup END

" ----- parsonsmatt/intero-neovim -----

augroup interoMaps
  au!
  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>yg :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 1

" Change the intero window size; default is 10.
let g:intero_window_size = 70

" Sets the intero window to split vertically; default is horizontal
let g:intero_vertical_split = 1

let g:intero_use_neomake = 1


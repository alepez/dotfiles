let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_clang_enabled_makers = ['clang']
let g:neomake_verbose = 0

" When writing or reading a buffer, and on changes in insert and normal mode
" (no delay when writing).
call neomake#configure#automake('nrwi', 500)

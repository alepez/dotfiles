" Disable haskell-vim omnifunc
" https://github.com/eagletmt/neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" necoghc should work with YouCompleteMe. To enable auto-completions:
let g:ycm_semantic_triggers = {'haskell' : ['.']}

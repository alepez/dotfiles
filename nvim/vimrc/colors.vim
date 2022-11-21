syntax on

set background=dark
set termguicolors

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
" { test me! }
hi MatchParen cterm=bold ctermbg=black ctermfg=white

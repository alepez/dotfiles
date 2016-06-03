" I ♥ colors
syntax on
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
hi MatchParen cterm=bold ctermbg=black ctermfg=white


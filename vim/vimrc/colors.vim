" I ♥ colors
syntax on
set t_Co=256
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" Italic FIXME is this working?
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
" { test me! }
hi MatchParen cterm=bold ctermbg=black ctermfg=white

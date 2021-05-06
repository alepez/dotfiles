" I ♥ colors
syntax on
set t_Co=256
" set termguicolors
set background=dark

" gruvbox
colorscheme gruvbox

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
" { test me! }
hi MatchParen cterm=bold ctermbg=black ctermfg=white

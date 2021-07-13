syntax on
set background=dark

let g:material_style = 'darker'
let g:material_italic_comments = 1
let g:material_italic_keywords = 1
let g:material_italic_functions = 1
let g:material_contrast = 1

colorscheme material

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
" { test me! }
hi MatchParen cterm=bold ctermbg=black ctermfg=white

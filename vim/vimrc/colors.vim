syntax on
set background=dark
set termguicolors

let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
" { test me! }
hi MatchParen cterm=bold ctermbg=black ctermfg=white

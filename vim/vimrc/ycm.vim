let g:ycm_confirm_extra_conf = 0 " load local ycm configuration silently.
let g:ycm_use_ultisnips_completer = 1 " Enable UltiSnips for YCM

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

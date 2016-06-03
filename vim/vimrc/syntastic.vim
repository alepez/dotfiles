" Set Syntastic checkers
" Note: checkers must be installed
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_cpp_compiler = '/usr/bin/clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_error_symbol=''
let g:syntastic_warning_symbol=''
let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [],
		\ "passive_filetypes": [] }

" Force check with this shortcut
nnoremap <leader>s :SyntasticCheck<CR>

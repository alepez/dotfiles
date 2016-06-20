let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_verbose = 0
" let g:neomake_open_list = 1

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-Wall', '-Wextra', '-Weverything', '-pedantic'],
   \ }

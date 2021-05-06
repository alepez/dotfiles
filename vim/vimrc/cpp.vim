" Special configuratation for cpp AutoFormat (see Chiel92/vim-autoformat plugin)
let g:formatdef_clangformat_cpp = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let g:formatters_cpp = ['clangformat_cpp']

" Map some shortcuts only for C and CPP files
augroup Cpp
  " .h always as cpp
  autocmd BufRead,BufNewFile *.h set filetype=cpp
  " Comment with //
  autocmd FileType cpp setlocal commentstring=//\ %s
  autocmd FileType c   setlocal commentstring=//\ %s
augroup END

augroup CMake
  autocmd!
  autocmd FileType cmake setlocal commentstring=#\ %s
augroup END

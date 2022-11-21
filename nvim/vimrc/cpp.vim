" Map some shortcuts only for C and CPP files
augroup Cpp
  " .h always as cpp
  autocmd BufRead,BufNewFile *.h set filetype=cpp
  " Comment with //
  autocmd FileType c,cpp setlocal commentstring=//\ %s
  " Switch source/header
  autocmd FileType c,cpp noremap <F10> :ClangdSwitchSourceHeader<CR>
augroup END

augroup CMake
  autocmd!
  autocmd FileType cmake setlocal commentstring=#\ %s
augroup END

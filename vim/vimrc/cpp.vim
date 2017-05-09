let g:cpp_experimental_template_highlight=1
let g:cpp_class_scope_highlight=1

" Special configuratation for cpp AutoFormat (see Chiel92/vim-autoformat plugin)
let g:formatdef_clangformat_cpp = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let g:formatters_cpp = ['clangformat_cpp']

" Enable chromatica (clang syntax highlight)
let g:chromatica#enable_at_startup=1

" Map some shortcuts only for C and CPP files
augroup Cpp
  " .h always as cpp
  autocmd BufRead,BufNewFile *.h set filetype=cpp
  " Comment with //
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END

" This script cd up until a Makefile is found, then call make.
set makeprg=~/.dotfiles/bin/make-closest-makefile

augroup CMake
  autocmd!
  autocmd FileType cmake setlocal commentstring=#\ %s
augroup END

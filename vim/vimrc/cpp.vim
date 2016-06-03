"---------- C/C++ {{{
let g:cpp_experimental_template_highlight=1
let g:cpp_class_scope_highlight=1

" Special configuratation for cpp AutoFormat (see Chiel92/vim-autoformat plugin)
let g:formatdef_clangformat_cpp = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let g:formatters_cpp = ['clangformat_cpp']

fu! CInclude()
  normal gg/#incOinc
endf

" Map some shortcuts only for C and CPP files
augroup Cpp
	autocmd BufRead,BufNewFile *.h set filetype=cpp " Set extra filetypes
	" Refresh tags with ctags
	autocmd FileType cpp nnoremap <leader>R :Silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -I _GLIBCXX_NOEXCEPT -f .tags . <CR>
  autocmd FileType cpp setlocal noexpandtab
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END

" This script cd up until a Makefile is found, then call make.
set makeprg=~/.dotfiles/bin/make-closest-makefile
" }}}

"---------- CMake {{{
augroup CMake
  autocmd!
  autocmd FileType cmake setlocal commentstring=#\ %s
augroup END
" }}}

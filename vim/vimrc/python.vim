augroup python
	autocmd!
	autocmd FileType python set ts=4 autoindent shiftwidth=4
augroup END

let g:pymode_lint_options_pep8 =
    \ {'max_line_length': 1000 }

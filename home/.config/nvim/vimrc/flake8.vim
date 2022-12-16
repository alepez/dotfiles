let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
autocmd BufWritePost *.py call flake8#Flake8()

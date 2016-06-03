" Markdown

augroup WrapLineInMarkdownFile
	autocmd!
	" assign markdown filetype to files with .md extension
	autocmd BufRead,BufNewFile *.md set filetype=markdown
	" Number of characters from the right window border where wrapping starts
	autocmd FileType markdown setlocal wrapmargin=0
	" Maximum width of text
	autocmd FileType markdown setlocal textwidth=80
	" Wrap lines
	autocmd FileType markdown setlocal wrap
	" Initialize pencil plugin
	" autocmd FileType markdown call pencil#init()
	" Add specific shortcuts for markdown
	" <leader>- add a new element to the bullet list
	autocmd FileType markdown nnoremap <leader>- o<Esc>S<space>-<space>
augroup END

let g:instant_markdown_autostart = 0

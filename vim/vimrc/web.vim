" Enable browserlink livereload for these types:
let g:bl_pagefiletypes = ['html', 'javascript']

augroup Javascript
	autocmd!
  autocmd BufWritePost,BufEnter *.{es6,js} Neomake
  autocmd BufRead,BufNewFile *.{es6,es6.js} set filetype=javascript
augroup END

" Disable tsuquyomi (typescript) default mapping (like C-^)
let g:tsuquyomi_disable_default_mappings = 1

" Enable browserlink livereload for these types:
let g:bl_pagefiletypes = ['html', 'javascript', 'php', 'smarty', 'javascript.jsx']

" react.js jsx
let g:jsx_ext_required = 1 " Disallow JSX in normal JS files
let g:formatdef_esformatter_javascript_jsx = '"esformatter "'
let g:formatters_javascript_jsx = [ 'esformatter_javascript_jsx' ]

let g:formatdef_tidy_html = '"tidy -q --show-errors 0 --show-warnings 0 --force-output --indent auto --indent-spaces ".shiftwidth()." --vertical-space yes --tidy-mark no -wrap ".&textwidth'
let g:formatdef_tidy_xml = '"tidy -q -xml --show-errors 0 --show-warnings 0 --force-output --indent auto --indent-spaces ".shiftwidth()." --vertical-space yes --tidy-mark no -wrap ".&textwidth'

augroup Css
	autocmd!
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

augroup Smarty
	autocmd!
  autocmd FileType smarty setlocal commentstring={*\ %s\ *}
augroup END

"---------- gtest {{{
augroup GTest
	autocmd FileType cpp nnoremap <leader>tt :GTestRun<CR>
	autocmd FileType cpp nnoremap <leader>tu :GTestRunUnderCursor<CR>
	autocmd FileType cpp nnoremap <leader>tc :GTestCase<space>
	autocmd FileType cpp nnoremap <leader>tn :GTestName<space>
	autocmd FileType cpp nnoremap <leader>te :GTestToggleEnabled<CR>
	autocmd FileType cpp nnoremap ]T :GTestNext<CR>
	autocmd FileType cpp nnoremap [T :GTestPrev<CR>
	autocmd FileType cpp nnoremap <leader>tj :GTestJump<CR>
	autocmd FileType cpp nnoremap <leader>ti :GTestNewTest<CR>i
augroup END
" }}}

"---------- rust {{{
augroup TestRust
	autocmd FileType rust nnoremap <leader>tt :TestSuite<CR>
	autocmd FileType rust nnoremap <leader>tu :TestNearest<CR>
	autocmd FileType rust nnoremap <leader>tj :TestVisit<CR>
augroup END
" }}}

" We use asyncrun to run tests
let test#strategy = "asyncrun_background"

" Automatically open quickfix window when async run starts
autocmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)

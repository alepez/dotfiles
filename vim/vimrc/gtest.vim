"---------- gtest {{{
augroup GTest
	autocmd FileType cpp nnoremap <leader>tt :GTestRun<CR>
	autocmd FileType cpp nnoremap <leader>tu :GTestRunUnderCursor<CR>
	autocmd FileType cpp nnoremap <leader>tc :GTestCase<space>
	autocmd FileType cpp nnoremap <leader>tn :GTestName<space>
	autocmd FileType cpp nnoremap <leader>te :GTestToggleEnabled<CR>
	autocmd FileType cpp nnoremap ]T :GTestNext<CR>
	autocmd FileType cpp nnoremap [T :GTestPrev<CR>
	autocmd FileType cpp nnoremap <leader>tf :CtrlPGTest<CR>
	autocmd FileType cpp nnoremap <leader>tj :GTestJump<CR>
	autocmd FileType cpp nnoremap <leader>ti :GTestNewTest<CR>i
augroup END
" }}}

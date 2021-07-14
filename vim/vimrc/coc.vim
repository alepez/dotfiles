" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_leader() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_leader() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-leader> to trigger completion.
inoremap <silent><expr> <c-leader> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>af  <Plug>(coc-format-selected)
nmap <leader>af  <Plug>(coc-format)

nmap <leader>cl  <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>g  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>d  :<C-u>CocList outline<cr>
" Search workleader symbols.
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" coc-bookmarks
nmap <F11> <Plug>(coc-bookmark-toggle)
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)

" coc-highlight
" Highlight symbol on hold
autocmd CursorHold * silent call CocActionAsync('highlight')

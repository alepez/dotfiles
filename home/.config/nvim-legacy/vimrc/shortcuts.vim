" Change leader to a more efficient button
let mapleader = "\<Space>"

" Nerd Tree shortcut
nnoremap <leader>ne :NvimTreeToggle<cr>

" Search with ag, the silver searcher
nnoremap <leader>f :Ack!<space>

" Search visual selection with ag
vnoremap <leader>f y:Ack! '<C-r>0'<CR>

" Telescope
nnoremap <leader>; <cmd>Telescope commands<cr>
nnoremap <leader>o <cmd>Telescope buffers<cr>
nnoremap <C-p>     <cmd>Telescope find_files<cr>
nnoremap <leader>q <cmd>Telescope quickfix<cr>
nnoremap <leader>s <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>

" turn off search highlight and close quickfix
fu! SmartRefresh()
  " Close quickfix window
  ccl
  " Close location window
  lcl
  " Check for file changes
  checktime
  " Redraw
  redraw!
endf

nnoremap <silent> <leader><leader> :call SmartRefresh() \| nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" To next quickfix line
noremap <F6> :cn<CR>

" To next location line (wrap to begin after last) http://stackoverflow.com/a/27199153/786186
noremap <F7> :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

" Close buffers without pain
nnoremap <silent> <leader>x :bd<CR>

" Save without pain
nnoremap <silent> <leader>w :w<CR>

" I've mapped all ctrl to esc. Sometimes I hit <c-space>w instead of
" <esc><space>w when saving in insert mode.
" In terminals, <c-space> is mapped to <Nul>
inoremap <silent> <Nul>w <Esc>:w<CR>
nnoremap <silent> <Nul>w <Esc>:w<CR>

" Split line under cursor (insert a line break)
nnoremap K i<CR><Esc>

" Search current visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Copy/Paste system from/to clipboard in visual mode
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P

" Copy the whole buffer to clipboard
nmap <leader>ay gg"+yG
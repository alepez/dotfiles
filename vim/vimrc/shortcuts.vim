" Change leader to a more efficient button
let mapleader = "\<Space>"

" NO ideavim {{{

" Save and make
nnoremap <silent> <leader>e <Esc>:update<CR>:Make<CR>

" Search with ag, the silver searcher
nnoremap <leader>f :Ack!<space>

" Search yanked text with the silver searcher
nnoremap <leader>F :Ack! '<C-r>0'<CR>

" Search visual selction with ag
vnoremap <leader>f y:Ack! '<C-r>0'<CR>

" Nerd Tree shortcut
nnoremap <leader>ne :NERDTreeToggle<cr>

" fzf command palette
nnoremap <leader>; :Commands<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <C-p> <Esc>:FZF<CR>

" turn off search highlight and close quickfix
fu! SmartRefresh()
  " Close quickfix window
  ccl
  " Close location window
  lcl
  " Refresh signify
  SignifyRefresh
  " Check for file changes
  checktime
  " Redraw
  redraw!
endf

nnoremap <silent> <leader><leader> :call SmartRefresh() \| nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Reindent all and return the same line where you were
" nnoremap <leader>af :Autoformat<CR>
" vnoremap <leader>af :'<,'>Autoformat<CR>

" Switch to file under cursor (plugin a.vim)
noremap <F3> :IH<CR>
" Switch header/implementation (plugin a.vim)
noremap <F4> :A<CR>
" To next quickfix line
noremap <F6> :cn<CR>
" To next location line (wrap to begin after last) http://stackoverflow.com/a/27199153/786186
noremap <F7> :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

" Go to definition
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" }}}

" ONLY ideavim {{{

" }}}

" Close buffers without pain
nnoremap <silent> <leader>x :bd<CR>

" Save without pain
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> z<space> :w<CR>

" Toggle quickfix and location list
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" I've mapped all ctrl to esc. Sometimes I hit <c-space>w instead of
" <esc><space>w when saving in insert mode.
" In terminals, <c-space> is mapped to <Nul>
inoremap <silent> <Nul>w <Esc>:w<CR>
nnoremap <silent> <Nul>w <Esc>:w<CR>

" Krack line under cursor (insert a line break)
nnoremap K i<CR><Esc>

" Search current visual selection
vnoremap // y/<C-R>"<CR>

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Search without escaping slash
command! -nargs=1 Ss let @/ = <q-args>|set hlsearch
nnoremap <leader>/ :Ss<space>

nnoremap gC I/* A */

" tagbar
nmap <F8> :TagbarToggle<CR>

" Copy/Paste system from/to clipboard in visual mode
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P

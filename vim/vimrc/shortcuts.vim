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

" cltrp command palette
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
nnoremap <leader>af :Autoformat<CR>
vnoremap <leader>af :'<,'>Autoformat<CR>

" Navigate marks with F2, like in ST
nmap <F2> <Esc>]`
" Switch to file under cursor (plugin a.vim)
noremap <F3> :IH<CR>
" Switch header/implementation (plugin a.vim)
noremap <F4> :A<CR>
" To next quickfix line
noremap <F6> :cn<CR>
" To next location line (wrap to begin after last) http://stackoverflow.com/a/27199153/786186
noremap <F7> :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

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

" FIXME DEPRECATED
" next/prev buffer - Map ctrl+shift-left and ctrl+shift-right
" Note: konsole (and other terminal emulators) may need remapping
nnoremap [1;6D :bprevious<CR>
nnoremap [1;6C :bnext<CR>

" FIXME DEPRECATED
" Disable arrows and mouse wheel in insert mode
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

" FIXME DEPRECATED
" git add -A . && git commit with message all in command line
let g:gtest#highlight_failing_tests = 1
fu! GitCommitQuick(...)
  let l:message=join(a:000, " ")
  execute 'silent !git add . -A && git commit -m "' . l:message . '"'
  redraw!
  execute 'SignifyRefresh'
  echom l:message
endf
command! -nargs=1 GitCommitQuick call GitCommitQuick(<f-args>)
nnoremap <leader>gg :GitCommitQuick<space>

nnoremap <leader>gps :silent Dispatch! gps<CR>
nnoremap <leader>gpl :silent Dispatch! gpl<CR>

function! GitStatus()
  tabnew
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  read ! gs
endfunction

function! GitDiff()
  tabnew
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified ft=diff
  read ! git --no-pager diff HEAD
endfunction

" Show git diff in a new tab
nnoremap <leader>gd :call GitDiff()<CR>
nnoremap <leader>gs :call GitStatus()<CR>

if has('nvim')
  nnoremap <leader>gl :term gl<CR>
else
  nnoremap <leader>gl :!gl<CR><CR>
endif

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Search without escaping slash
command! -nargs=1 Ss let @/ = <q-args>|set hlsearch
nnoremap <leader>/ :Ss<space>

nnoremap gC I/* A */

" tagbar
nmap <F8> :TagbarToggle<CR>

" FIXME DEPRECATED
" Copy/Paste system clipboard in visual mode
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P
" Painless paste from system clipboard
nmap <Leader>p "+p
nmap <Leader>P "+P

" FIXME DEPRECATED
" Uppercase last insertion
nmap <leader>U v`[U

" FIXME DEPRECATED
" Expand/Shrink region with v/C-v
" Thanks to: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" FIXME: this is useful, but breaks QuickFix
" Type 12<Enter> to go to line 12 (12G breaks my wrist)
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
" Thanks to: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" nnoremap <CR> G
" nnoremap <BS> gg

" Change leader to a more efficient button
let mapleader = "\<Space>"

" Close buffers without pain
nnoremap <silent> <leader>x :bd<CR>

" Save without pain
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> z<space> :w<CR>

" Save and make
nnoremap <silent> <leader>e <Esc>:update<CR>:Make<CR>

" Save and exit
" nnoremap <silent> <leader>q <Esc>:update<CR>:q<CR>

" I've mapped all ctrl to esc. Sometimes I hit <c-space>w instead of
" <esc><space>w when saving in insert mode.
" In terminals, <c-space> is mapped to <Nul>
inoremap <silent> <Nul>w <Esc>:w<CR>
nnoremap <silent> <Nul>w <Esc>:w<CR>

" Krack line under cursor (insert a line break)
nnoremap K i<CR><Esc>

" Search current visual selection
vnoremap // y/<C-R>"<CR>

" Search with ag, the silver searcher
nnoremap <leader>f :Ag<space>

" Search yanked text with the silver searcher
nnoremap <leader>F :Ag '<C-r>0'<CR>

" Search visual selction with ag
vnoremap <leader>f y:Ag '<C-r>0'<CR>

" next/prev buffer - Map ctrl+shift-left and ctrl+shift-right
" Note: konsole (and other terminal emulators) may need remapping
nnoremap [1;6D :bprevious<CR>
nnoremap [1;6C :bnext<CR>

" Disable arrows and mouse wheel in insert mode
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

" Nerd Tree shortcut
nnoremap <leader>ne :NERDTreeToggle<cr>

" cltrp command palette
nnoremap <leader>; :CtrlPCmdPalette<CR>
nnoremap <leader>o :CtrlPBuffer<CR>

" turn off search highlight and close quickfix
nnoremap <silent> <leader><leader> :nohlsearch \| ccl \| lclose \| SignifyRefresh \| redraw!<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Reindent all and return the same line where you were
nnoremap <leader>af :Autoformat<CR>
vnoremap <leader>af :'<,'>Autoformat<CR>

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

if has('nvim')
  nnoremap <leader>gd :term gd<CR>
  nnoremap <leader>gl :term gl<CR>
  nnoremap <leader>gs :term gs<CR>
else
  nnoremap <leader>gd :!gd<CR><CR>
  nnoremap <leader>gl :!gl<CR><CR>
  nnoremap <leader>gs :!clear;gs<CR>
endif

" Navigate marks with F2, like in ST
nmap <F2> <Esc>]`
" Switch to file under cursor (plugin a.vim)
noremap <F3> :IH<CR>
" Switch header/implementation (plugin a.vim)
noremap <F4> :A<CR>
" To next error
noremap <F6> <Esc>:cn<CR>
" Repeat last command
noremap <F7> <Esc>q:k<CR>
" Run last vimux command
noremap <F8> <Esc>:update<CR>:VimuxRunLastCommand<CR>
" Make in background
noremap <F11> <Esc>:update<CR>:Make!<CR>
" Make in foreground
noremap <F12> <Esc>:update<CR>:Make<CR>

" z repeat mapped to most used F#
nmap zzz <F8>
nmap zz <F12>

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Search without escaping slash
command! -nargs=1 Ss let @/ = <q-args>|set hlsearch
nnoremap <leader>/ :Ss<space>

nnoremap gC I/* A */

" Copy/Paste system clipboard in visual mode
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P
" Painless paste from system clipboard
nmap <Leader>p "+p
nmap <Leader>P "+P

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

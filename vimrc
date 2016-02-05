" @filename: ~/.vimrc

"---------- gvim {{{
" I don't always use gvim, but when I do, I want it minimal.
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Awesome font for coding, with a lot of useful icons.
" https://github.com/ryanoasis/nerd-fonts
set guifont=Sauce\ Code\ Powerline\ PNFT\ Mono
" }}}

"---------- colors {{{
" I ♥ colors
syntax on
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
hi MatchParen cterm=bold ctermbg=black ctermfg=white
" }}}

"---------- vundle {{{
set nocompatible              " required
filetype off                  " required

" Initialize Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}

"---------- disabled plugins {{{
"Plugin 'lyuts/vim-rtags' " Vim bindings for rtags, llvm/clang based c++ code indexer.
"Plugin 'tpope/vim-speeddating' " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
"Plugin 'tpope/vim-repeat' " repeat.vim: enable repeating supported plugin maps with .
"Plugin 'jszakmeister/vim-togglecursor' " Show different cursor for different modes (konsole support)
"Plugin 'tpope/vim-abolish' " easily search for, substitute, and abbreviate multiple variants of a word
"Plugin 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
" }}}

"---------- plugins {{{
"Plugin 'alepez/vim-gtest' " Run google tests inside vim (I'm the dev, so I don't want this to be handled by Vundle)
"Plugin 'alepez/vim-llvmcov' " Show test coverage (I'm the dev, so I don't want this to be handled by Vundle)
Plugin 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plugin 'ervandew/supertab' " Supertab allows you to use <Tab> for all your insert completion needs
Plugin 'benmills/vimux' " Run commands inside tmux window
Plugin 'tpope/vim-fugitive' " git gui
Plugin 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plugin 'scrooloose/syntastic.git' " check syntax
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'fisadev/vim-ctrlp-cmdpalette' " fuzzy command search
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'bling/vim-bufferline' " super simple vim plugin to show the list of buffers in the command bar
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'godlygeek/tabular' " Vim script for text filtering and alignment. Note: must come before vim-markdown
Plugin 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plugin 'peterhoeg/vim-qml' " QML syntax highlighting for VIM
Plugin 'rdnetto/YCM-Generator' " Automatically generates YouCompleteMe configuration based on Makefile
Plugin 'mhinz/vim-signify' " show diff in gutter
Plugin 'mattn/gist-vim' " vimscript for gist
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'a.vim' " Alternate files quickly (header/implementation etc...)
Plugin 'sjl/gundo.vim' " Gundo is a Vim plugin for visualizing your undo tree to make it usable
Plugin 'kshenoy/vim-signature' " bookmark manager
Plugin 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight
Plugin 'SirVer/ultisnips' " Snippets engine
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plugin 'tpope/vim-dispatch' " build in bakcground
Plugin 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plugin 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-markdown' " for markdown editing, with concealing support
Plugin 'reedes/vim-pencil' " Prose editing improved (markdown etc...)
Plugin 'ap/vim-css-color' " Preview colours in source code while editing
Plugin 'jaxbot/browserlink.vim' " like livereload
Plugin 'suan/vim-instant-markdown' " preview markdown in browser (needs `npm -g install instant-markdown-d`)
Plugin 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
Plugin 'pangloss/vim-javascript' " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'smarty-syntax' " Syntax highlight for Smarty Template Engine
Plugin 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plugin 'tpope/vim-commentary' " Comment stuff out
Plugin 'jamessan/vim-gnupg' " transparent editing of gpg encrypted files
Plugin 'klen/python-mode' " Python
Plugin 'alfredodeza/pytest.vim' " unit test runner for python
Plugin 'terryma/vim-expand-region' " visually select increasingly larger regions of text using the same key combination
Plugin 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

" vim-devicons must be loaded after all other plugins
" needs a good font with icons, like patched fonts you can find at
" https://github.com/ryanoasis/nerd-fonts
Plugin 'ryanoasis/vim-devicons' " Add fonts icons
" }}}

"---------- vundle end {{{
" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

"---------- Plugins developed by me {{{
set rtp+=~/.vim/bundle/vim-gtest
set rtp+=~/.vim/bundle/vim-llvmcov
" }}}

"---------- other plugins {{{
" fzf is not only a vim plugin, must be installed. See https://github.com/junegunn/fzf
set rtp+=~/.fzf
" }}}

"---------- autoreload vimrc on changes {{{
" $MYVIMRC (~/.vimrc) and $MYGVIMRC (~/.gvimrc) must exists or an error will appear
augroup AutoreloadVimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" }}}

"---------- Always show the sign (also called gutter) {{{
augroup AlwaysShowTheSign
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END
" }}}

"---------- shortcuts {{{
" Change leader to a more efficient button
let mapleader = "\<Space>"

" Close buffers without pain
nnoremap <silent> <leader>x :bd<CR>

" Save without pain
nnoremap <silent> z :w<CR>
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
nnoremap <leader>gd :!gd<CR><CR>
nnoremap <leader>gl :!gl<CR><CR>
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
nmap <Leader>p "+p
nmap <Leader>P "+P

" Expand/Shrink region with v/C-v
" Thanks to: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Type 12<Enter> to go to line 12 (12G breaks my wrist)
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
" Thanks to: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <CR> G
nnoremap <BS> gg

" }}}

"---------- caps-lock {{{
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" <C-^> to toggle caps-lock
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" }}}

"---------- NERDTree {{{
:let NERDTreeQuitOnOpen = 1
" }}}

"---------- Ignore these files {{{
" (apply even to ctrlp if ctrlp_user_command isn't set)
set wildignore+=*/tmp/*
set wildignore+=*.so,*.o,*.d,*.gcda,*.gcno
set wildignore+=*.zip,*.tar,*.tar.gz,*.tar.bz2,*.tgz
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/__pycache__
set wildignore+=*/node_modules
" }}}

"---------- ctrlp {{{
let g:ctrlp_map = '<C-p>' " If it's called ctrlp...
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0 " 0: use full path, 1: use filename only
let g:ctrlp_switch_buffer = 'E' " Jump to the file with <CR>
let g:ctrlp_root_markers = ['.ycm_extra_conf.py', '.git', '.svn', '.rootdir'] " ctrlp uses .git, .svn, ... as project root. Use these markers too
let g:ctrlp_open_multiple_files = 'i' " open selected files in hidden buffers

" Use ag, the silver searcher, for ctrlp search.
" Note: wildignore doesn't apply with this option, you need .agignore file
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}

"---------- Set Syntastic checkers {{{
" Note: checkers must be installed
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_cpp_compiler = '/usr/bin/clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_error_symbol=''
let g:syntastic_warning_symbol=''
let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [ 'javascript' ],
		\ "passive_filetypes": [] }
" }}}

"---------- signify {{{
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=235  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=235 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=235 ctermfg=227
let g:signify_update_on_bufenter = 1 " FIXME: this is not working
" }}}

"---------- Standard Vim settings {{{
set autoindent " always set autoindenting on
set autoread " Make Vim automatically open changed files
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set clipboard=unnamed " yank to clipboard
set colorcolumn=80,120 " show columns at 80 and 120
set completeopt=menu,menuone " complete menu visibility
set cursorline " Highlight current line
set diffopt+=vertical
set expandtab " expand tabs to spaces
set exrc secure " per-directory .vimrc files, unsafe commands disabled
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folders max
set gdefault " assume the /g flag on :s substitutions to replace all matches
set hidden " Set hidden to allow buffers to be browsed
set history=8192 " With a powerful PC, we can have a huge history.
set hlsearch " Highlight search results
set incsearch " as I start to search, the file jumps to the match as I type.
set lazyredraw " only redraw when needed
set list " Show invisible characters
set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:⎵ " Use these symbols for invisible
set modelines=1 " The number of lines that is checked for set commands
set noautochdir " Prevent changing directory when opening files
set noerrorbells " Disable error bells
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set nospell " Disable spell check
set nostartofline " Don’t reset cursor to start of line when moving around.
set nowrap " turn off soft wrap
set number " Show line number
set relativenumber " ...but show relative numbers except for the current line
set ruler " Show ruler on the statusline
set scrolloff=8 sidescrolloff=15 sidescroll=1 " When to start scrolling
set shiftwidth=2 " indent by 2 spaces
set shortmess=I " I: no intro message.
set showcmd " Show command line
set showmatch " highlight matching [{()}]
set showmode " Show mode
set smartcase "don't ignore Capitals when present
set splitright " ensures new splits are to the right of current
set tabstop=2 " The default is 8 which is MASSIVE!!
set tags=./.tags;,.tags; " tags files are hidden
set textwidth=0 wrapmargin=0 " turn off hard line wrapping
set title " Vim sets terminal title
set ttimeout " removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " removes the delay when hitting esc in insert mode
set ttyfast " sends more characters to the screen for fast terminal connections
set wildmenu " visually autocomplete the command menu
set wildmode=list:longest,list:full " Show a list of completions
" }}}

"---------- Silently execute external commands, without needing to redraw {{{
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
" }}}

"---------- Turn off swap files and backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}

"---------- Markdown {{{
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
	autocmd FileType markdown call pencil#init()
	" Add specific shortcuts for markdown
	" <leader>- add a new element to the bullet list
	autocmd FileType markdown nnoremap <leader>- o<Esc>S<space>-<space>
augroup END

let g:instant_markdown_autostart = 0

" }}}

"---------- C/C++ {{{
let g:cpp_experimental_template_highlight=1
let g:cpp_class_scope_highlight=1

" Special configuratation for cpp AutoFormat (see Chiel92/vim-autoformat plugin)
let g:formatdef_clangformat_cpp = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let g:formatters_cpp = ['clangformat_cpp']

" Map some shortcuts only for C and CPP files
augroup Cpp
	autocmd BufRead,BufNewFile *.h set filetype=cpp " Set extra filetypes
	" Refresh tags with ctags
	autocmd FileType cpp nnoremap <leader>R :Silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -I _GLIBCXX_NOEXCEPT -f .tags . <CR>
  autocmd FileType cpp setlocal noexpandtab
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END

" This script cd up until a Makefile is found, then call make.
set makeprg=~/.dotfiles/bin/make-closest-makefile
" }}}

"---------- CMake {{{
augroup CMake
  autocmd!
  autocmd FileType cmake setlocal commentstring=#\ %s
augroup END
" }}}

"---------- the silver search {{{
let g:ag_working_path_mode="r" " Search in project directory
" }}}

"---------- gtest {{{
"let g:gtest#gtest_command = ""
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

"---------- Snippets and YouCompleteMe {{{
let g:ycm_confirm_extra_conf = 0 " load local ycm configuration silently.
let g:ycm_use_ultisnips_completer = 0 " Disable UltiSnips for YCM

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

"---------- airline {{{

" the theme
let g:airline_theme='pez' " Sometime this does not work... why?
au VimEnter * AirlineTheme pez " Fix for the above

" always show statusbar
set laststatus=2

" Enable the list of buffers (statusline, bottom)
let g:airline#extensions#bufferline#enabled = 1

" Enable the list of tabs (tabline, top)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Enable syntastic
let g:airline#extensions#syntastic#enabled = 1

" Disable echo of current buffer in commandline
let g:bufferline_echo = 0
" }}}

"---------- vimux {{{
let g:VimuxOrientation = "h"
" }}}

"---------- web {{{

" Enable browserlink livereload for these types:
let g:bl_pagefiletypes = ['html', 'javascript', 'php', 'tpl']

augroup Css
	autocmd!
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

augroup Javascript
	autocmd!
  let g:formatterpath = [ $NVM_BIN . '/js-beautify' ]
augroup END

augroup Smarty
	autocmd!
  autocmd FileType smarty setlocal commentstring={*\ %s\ *}
augroup END
" }}}

"---------- python {{{
augroup python
	autocmd!
	autocmd FileType python set ts=4 autoindent shiftwidth=4
augroup END
" }}}

"---------- zsh {{{
set shell=/bin/zsh
" }}}

"---------- cmdheight {{{
function! ResizeCmdHeight()
  if &columns < 120
    set cmdheight=2
  else
    set cmdheight=1
  endif
endfunction

call ResizeCmdHeight()
augroup ResizeCmdOnVimResizedx
    autocmd!
    autocmd VimResized * call ResizeCmdHeight()
augroup END
" }}}

"---------- Dependencies {{{
"
" - https://github.com/Andersbakken/rtags
" - https://github.com/ryanoasis/nerd-fonts
" - https://github.com/ggreer/the_silver_searcher
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

"---------- Include local vimrc {{{
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif
" }}}

" vim:foldmethod=marker:foldlevel=0

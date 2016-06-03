" @filename: ~/.vimrc

if has("gui_running")
  source ~/.dotfiles/vim/vimrc/gvim.vim
endif

source ~/.dotfiles/vim/vimrc/colors.vim
source ~/.dotfiles/vim/vimrc/autoreload.vim

"---------- plugins {{{

" vim needs nocompatible flag to run vundle
if !has('nvim')
  set nocompatible
endif

filetype off " required

" Initialize Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

source ~/.dotfiles/vim/vimrc/plugins-enabled.vim
source ~/.dotfiles/vim/vimrc/plugins-disabled.vim

" neovim plugins
" these plugins need features not available in classic vim
if has('nvim')
  source ~/.dotfiles/vim/vimrc/plugins-neovim.vim
endif

" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

source ~/.dotfiles/vim/vimrc/plugins-special.vim
source ~/.dotfiles/vim/vimrc/hacks.vim
source ~/.dotfiles/vim/vimrc/shortcuts.vim
source ~/.dotfiles/vim/vimrc/nerdtree.vim
source ~/.dotfiles/vim/vimrc/ignore.vim
source ~/.dotfiles/vim/vimrc/ctrlp.vim
source ~/.dotfiles/vim/vimrc/syntastic.vim
source ~/.dotfiles/vim/vimrc/signify.vim
source ~/.dotfiles/vim/vimrc/settings.vim
source ~/.dotfiles/vim/vimrc/backups.vim
source ~/.dotfiles/vim/vimrc/markdown.vim
source ~/.dotfiles/vim/vimrc/cpp.vim
source ~/.dotfiles/vim/vimrc/ag.vim










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

" neovim size is 80 when vimrc is sourced. So we need to resize on VimEnter
augroup ResizeCmdOnVimEnterOrResized
    autocmd!
    autocmd VimEnter * call ResizeCmdHeight()
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


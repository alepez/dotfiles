if has("gui_running")
  source ~/.dotfiles/vim/vimrc/gvim.vim
endif

source ~/.dotfiles/vim/vimrc/autoreload.vim

" vim needs nocompatible flag to run vundle
if !has('nvim')
  set nocompatible
endif

filetype off " required

call plug#begin()

source ~/.dotfiles/vim/vimrc/plugins-enabled.vim

" neovim plugins
" these plugins need features not available in classic vim
if has('nvim')
  source ~/.dotfiles/vim/vimrc/plugins-neovim.vim
endif

" Plugins cannot be loaded below this line
call plug#end()

source ~/.dotfiles/vim/vimrc/colors.vim

filetype plugin indent on    " required

source ~/.dotfiles/vim/vimrc/plugins-special.vim
source ~/.dotfiles/vim/vimrc/hacks.vim
source ~/.dotfiles/vim/vimrc/shortcuts.vim
source ~/.dotfiles/vim/vimrc/gtest.vim
source ~/.dotfiles/vim/vimrc/nerdtree.vim
source ~/.dotfiles/vim/vimrc/ignore.vim
source ~/.dotfiles/vim/vimrc/ctrlp.vim
source ~/.dotfiles/vim/vimrc/signify.vim
source ~/.dotfiles/vim/vimrc/settings.vim
source ~/.dotfiles/vim/vimrc/backups.vim
source ~/.dotfiles/vim/vimrc/markdown.vim
source ~/.dotfiles/vim/vimrc/cpp.vim
source ~/.dotfiles/vim/vimrc/ag.vim
source ~/.dotfiles/vim/vimrc/ycm.vim
source ~/.dotfiles/vim/vimrc/snippets.vim
source ~/.dotfiles/vim/vimrc/airline.vim
source ~/.dotfiles/vim/vimrc/web.vim
source ~/.dotfiles/vim/vimrc/python.vim
source ~/.dotfiles/vim/vimrc/zsh.vim
source ~/.dotfiles/vim/vimrc/lldb.vim

if has('nvim')
  source ~/.dotfiles/vim/vimrc/neomake.vim
endif

" Include local vimrc is file exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

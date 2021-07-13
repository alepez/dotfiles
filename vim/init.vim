filetype off " required

packadd termdebug

call plug#begin()

" Plugins handled by plugin manager
source ~/.dotfiles/vim/vimrc/plugins.vim

" Plugins cannot be loaded below this line
call plug#end()

source ~/.dotfiles/vim/vimrc/colors.vim

filetype plugin indent on    " required

" Plugins not handled by plugin manager
source ~/.dotfiles/vim/vimrc/plugins-special.vim

source ~/.dotfiles/vim/vimrc/hacks.vim
source ~/.dotfiles/vim/vimrc/shortcuts.vim
source ~/.dotfiles/vim/vimrc/test.vim
source ~/.dotfiles/vim/vimrc/ignore.vim
source ~/.dotfiles/vim/vimrc/settings.vim
source ~/.dotfiles/vim/vimrc/markdown.vim
source ~/.dotfiles/vim/vimrc/cpp.vim
source ~/.dotfiles/vim/vimrc/coc.vim
source ~/.dotfiles/vim/vimrc/telescope.lua

" Include local vimrc is file exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

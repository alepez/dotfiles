filetype off " required

packadd termdebug

call plug#begin()

" Plugins handled by plugin manager
source ~/.dotfiles/nvim/plugins.vim

" Plugins cannot be loaded below this line
call plug#end()

source ~/.dotfiles/nvim/colors.vim

filetype plugin indent on    " required

" Plugins not handled by plugin manager
source ~/.dotfiles/nvim/plugins-special.vim

source ~/.dotfiles/nvim/hacks.vim
source ~/.dotfiles/nvim/shortcuts.vim
source ~/.dotfiles/nvim/test.vim
source ~/.dotfiles/nvim/nerdtree.vim
source ~/.dotfiles/nvim/ignore.vim
source ~/.dotfiles/nvim/fzf.vim
source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/backups.vim
source ~/.dotfiles/nvim/markdown.vim
source ~/.dotfiles/nvim/cpp.vim
source ~/.dotfiles/nvim/ag.vim
source ~/.dotfiles/nvim/airline.vim
source ~/.dotfiles/nvim/zsh.vim
source ~/.dotfiles/nvim/coc.vim

" Include local vimrc is file exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

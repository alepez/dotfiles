filetype off " required

packadd termdebug

call plug#begin()

" Plugins handled by plugin manager
source ~/.dotfiles/nvim/vimrc/plugins.vim

" Plugins cannot be loaded below this line
call plug#end()

source ~/.dotfiles/nvim/vimrc/colors.vim

filetype plugin indent on    " required

source ~/.dotfiles/nvim/vimrc/hacks.vim
source ~/.dotfiles/nvim/vimrc/shortcuts.vim
source ~/.dotfiles/nvim/vimrc/test.vim
source ~/.dotfiles/nvim/vimrc/ignore.vim
source ~/.dotfiles/nvim/vimrc/settings.vim
source ~/.dotfiles/nvim/vimrc/markdown.vim
source ~/.dotfiles/nvim/vimrc/cpp.vim
source ~/.dotfiles/nvim/vimrc/telescope.lua
source ~/.dotfiles/nvim/vimrc/lualine.lua
source ~/.dotfiles/nvim/vimrc/treesitter.lua
source ~/.dotfiles/nvim/vimrc/lspconfig.lua
source ~/.dotfiles/nvim/vimrc/compe.lua
source ~/.dotfiles/nvim/vimrc/flake8.vim
source ~/.dotfiles/nvim/vimrc/nvim-tree.lua
source ~/.dotfiles/nvim/vimrc/catpuccin.lua
source ~/.dotfiles/nvim/vimrc/diagnostic.lua

" Include local vimrc is file exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

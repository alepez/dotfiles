filetype off " required

packadd termdebug

call plug#begin()

" Plugins handled by plugin manager
source ~/.dotfiles/home/.config/nvim/vimrc/plugins.vim

" Plugins cannot be loaded below this line
call plug#end()

source ~/.dotfiles/home/.config/nvim/vimrc/colors.vim

filetype plugin indent on    " required

source ~/.config/nvim/vimrc/hacks.vim
source ~/.config/nvim/vimrc/shortcuts.vim
source ~/.config/nvim/vimrc/ignore.vim
source ~/.config/nvim/vimrc/settings.vim
source ~/.config/nvim/vimrc/markdown.vim
source ~/.config/nvim/vimrc/cpp.vim
source ~/.config/nvim/vimrc/telescope.lua
source ~/.config/nvim/vimrc/lualine.lua
source ~/.config/nvim/vimrc/treesitter.lua
source ~/.config/nvim/vimrc/lspconfig.lua
source ~/.config/nvim/vimrc/compe.lua
source ~/.config/nvim/vimrc/flake8.vim
source ~/.config/nvim/vimrc/nvim-tree.lua
source ~/.config/nvim/vimrc/catpuccin.lua
source ~/.config/nvim/vimrc/diagnostic.lua

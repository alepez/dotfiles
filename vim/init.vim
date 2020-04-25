filetype off " required

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
source ~/.dotfiles/vim/vimrc/gtest.vim
source ~/.dotfiles/vim/vimrc/nerdtree.vim
source ~/.dotfiles/vim/vimrc/ignore.vim
source ~/.dotfiles/vim/vimrc/ctrlp.vim
source ~/.dotfiles/vim/vimrc/fzf.vim
source ~/.dotfiles/vim/vimrc/signify.vim
source ~/.dotfiles/vim/vimrc/settings.vim
source ~/.dotfiles/vim/vimrc/backups.vim
source ~/.dotfiles/vim/vimrc/markdown.vim
source ~/.dotfiles/vim/vimrc/cpp.vim
source ~/.dotfiles/vim/vimrc/ag.vim
" source ~/.dotfiles/vim/vimrc/ycm.vim
source ~/.dotfiles/vim/vimrc/snippets.vim
source ~/.dotfiles/vim/vimrc/airline.vim
source ~/.dotfiles/vim/vimrc/web.vim
source ~/.dotfiles/vim/vimrc/python.vim
source ~/.dotfiles/vim/vimrc/zsh.vim
" source ~/.dotfiles/vim/vimrc/lldb.vim
source ~/.dotfiles/vim/vimrc/haskell.vim
source ~/.dotfiles/vim/vimrc/rust.vim

if has('nvim')
  source ~/.dotfiles/vim/vimrc/neomake.vim
  source ~/.dotfiles/vim/vimrc/deoplete.vim
endif

" Include local vimrc is file exists
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif

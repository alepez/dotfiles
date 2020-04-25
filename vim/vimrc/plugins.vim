" ==================== core    ====================
Plug 'morhetz/gruvbox' " Retro groove color scheme for Vim
Plug 'milkypostman/vim-togglelist' " Functions to toggle the [Location List] and the [Quickfix List] windows.
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plug 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plug 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plug 'honza/vim-snippets' " Snippets are separated from the engine
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'kshenoy/vim-signature' " bookmark manager
Plug 'sjl/gundo.vim' " Gundo is a Vim plugin for visualizing your undo tree to make it usable
Plug 'mileszs/ack.vim' " search with ag the silver searcher
Plug 'mhinz/vim-signify' " show diff in gutter
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'vim-airline/vim-airline-themes' " theme for the below
Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'scrooloose/nerdtree' " tree explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf (core)
Plug 'junegunn/fzf.vim' " fzf (more commands)
Plug 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'tpope/vim-fugitive' " git gui
Plug 'vim-scripts/ingo-library' " Vimscript library of common functions.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution in Vim
Plug 'majutsushi/tagbar'

" ==================== c++     ====================
Plug 'peterhoeg/vim-qml' " QML syntax highlighting for VIM
Plug 'alepez/vim-llvmcov' " Show test coverage
Plug 'alepez/vim-gtest' " Run google tests inside vim
Plug 'vim-scripts/a.vim' " Alternate files quickly (header/implementation etc...)
Plug 'vim-scripts/DoxygenToolkit.vim' " Simplify Doxygen documentation in C, C++, Python.

" ==================== rust    ====================
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" ==================== web     ====================
Plug 'vim-scripts/smarty-syntax' " Syntax highlight for Smarty Template Engine
Plug 'pangloss/vim-javascript' " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
Plug 'jaxbot/browserlink.vim' " like livereload
Plug 'ap/vim-css-color' " Preview colours in source code while editing
Plug 'cespare/vim-toml' " Vim syntax for TOML
Plug 'leafgarland/typescript-vim' " Typescript syntax files for Vim
Plug 'Quramy/tsuquyomi' " A Vim plugin for TypeScript

" ==================== python  ====================
Plug 'alfredodeza/pytest.vim' " unit test runner for python
Plug 'klen/python-mode', {'branch': 'develop'} " Python

" ==================== text    ====================
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " preview markdown in browser (needs `npm -g install instant-markdown-d`)
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment. Note: must come before vim-markdown
Plug 'plasticboy/vim-markdown' " Markdown Vim Mode (must come after tabular)

" ==================== haskell ====================
"Plug 'eagletmt/neco-ghc' " A completion plugin for Haskell, using ghc-mod
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'bitc/vim-hdevtools'

" vim-devicons must be loaded after all other plugins
" needs a good font with icons, like patched fonts you can find at
" https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons' " Add fonts icons
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

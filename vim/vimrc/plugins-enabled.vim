Plug 'vim-scripts/ingo-library' " Vimscript library of common functions.
Plug 'alepez/vim-gtest' " Run google tests inside vim (I'm the dev, so I don't want this to be handled by Vundle)
Plug 'alepez/vim-llvmcov' " Show test coverage (I'm the dev, so I don't want this to be handled by Vundle)
Plug 'tpope/vim-fugitive' " git gui
Plug 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
Plug 'fisadev/vim-ctrlp-cmdpalette' " fuzzy command search
Plug 'scrooloose/nerdtree' " tree explorer
Plug 'bling/vim-bufferline' " super simple vim plugin to show the list of buffers in the command bar
Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " theme for the above
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment. Note: must come before vim-markdown
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'peterhoeg/vim-qml' " QML syntax highlighting for VIM
Plug 'mhinz/vim-signify' " show diff in gutter
Plug 'mileszs/ack.vim' " search with ag the silver searcher
Plug 'vim-scripts/a.vim' " Alternate files quickly (header/implementation etc...)
Plug 'sjl/gundo.vim' " Gundo is a Vim plugin for visualizing your undo tree to make it usable
Plug 'kshenoy/vim-signature' " bookmark manager
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' " Snippets are separated from the engine
Plug 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plug 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plug 'tpope/vim-dispatch' " build in bakcground
Plug 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-markdown' " for markdown editing, with concealing support
Plug 'ap/vim-css-color' " Preview colours in source code while editing
Plug 'jaxbot/browserlink.vim' " like livereload
Plug 'suan/vim-instant-markdown' " preview markdown in browser (needs `npm -g install instant-markdown-d`)
Plug 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
Plug 'pangloss/vim-javascript' " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'mxw/vim-jsx' " reactjs
Plug 'vim-scripts/smarty-syntax' " Syntax highlight for Smarty Template Engine
Plug 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'klen/python-mode', {'branch': 'develop'} " Python
Plug 'alfredodeza/pytest.vim' " unit test runner for python
Plug 'vim-scripts/SyntaxRange' " Define a different filetype syntax on regions of a buffer.
Plug 'milkypostman/vim-togglelist' " Functions to toggle the [Location List] and the [Quickfix List] windows.
Plug 'morhetz/gruvbox' " Retro groove color scheme for Vim
Plug 'eagletmt/ghcmod-vim' " Happy Haskell programming on Vim, powered by ghc-mod
Plug 'eagletmt/neco-ghc' " A completion plugin for Haskell, using ghc-mod
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution in Vim

" vim-devicons must be loaded after all other plugins
" needs a good font with icons, like patched fonts you can find at
" https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons' " Add fonts icons

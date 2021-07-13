"=== General
Plug 'sainnhe/gruvbox-material' " Color scheme
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plug 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plug 'sjl/gundo.vim' " Gundo is a Vim plugin for visualizing your undo tree to make it usable
Plug 'mileszs/ack.vim' " search with ag the silver searcher
Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'kyazdani42/nvim-tree.lua' " tree explorer
Plug 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'vim-scripts/ingo-library' " Vimscript library of common functions.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-signify'
Plug 'hoob3rt/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"=== Language tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"=== C/C++/Qml
Plug 'jackguo380/vim-lsp-cxx-highlight' " Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd

"=== HTML/CSS
Plug 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
"Plug 'jaxbot/browserlink.vim' " like livereload
" Plug 'ap/vim-css-color' " Preview colours in source code while editing

"=== Configuration files
Plug 'cespare/vim-toml' " Vim syntax for TOML

"=== Text/Markdown
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment. Note: must come before vim-markdown
Plug 'plasticboy/vim-markdown' " Markdown Vim Mode (must come after tabular)

" vim-devicons must be loaded after all other plugins
" needs a good font with icons, like patched fonts you can find at
" https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons' " Add fonts icons
Plug 'kyazdani42/nvim-web-devicons' " Icons, needed by barbar

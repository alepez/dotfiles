"---------- Standard Vim settings {{{

" NO ideavim {{{
set mouse="" " Disable mouse (neovim enables it by default)
set lazyredraw " only redraw when needed
set noautochdir " Prevent changing directory when opening files
set nospell " Disable spell check
set title " Vim sets terminal title
set ttyfast " sends more characters to the screen for fast terminal connections
" }}}

set autoindent " always set autoindenting on
set autoread " Make Vim automatically open changed files
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set clipboard=unnamed " yank to clipboard
set colorcolumn=80,120 " show columns at 80 and 120
set completeopt=menu,menuone " complete menu visibility
set cursorline " Highlight current line
set diffopt+=vertical
set expandtab " expand tabs to spaces
set exrc secure " per-directory .vimrc files, unsafe commands disabled
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folders max
set gdefault " assume the /g flag on :s substitutions to replace all matches
set hidden " Set hidden to allow buffers to be browsed
set history=8192 " With a powerful PC, we can have a huge history.
set hlsearch " Highlight search results
set incsearch " as I start to search, the file jumps to the match as I type.
set list " Show invisible characters
set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:⎵ " Use these symbols for invisible
set modelines=1 " The number of lines that is checked for set commands
set noerrorbells " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
set nowrap " turn off soft wrap
set number " Show line number
set relativenumber " ...but show relative numbers except for the current line
set ruler " Show ruler on the statusline
set scrolloff=8 sidescrolloff=15 sidescroll=1 " When to start scrolling
set shiftwidth=2 " indent by 2 spaces
set shortmess=I " I: no intro message.
set showcmd " Show command line
set showmatch " highlight matching [{()}]
set showmode " Show mode
set smartcase "don't ignore Capitals when present
set splitright " ensures new splits are to the right of current
set tabstop=2 " The default is 8 which is MASSIVE!!
set tags=./.tags;,.tags; " tags files are hidden
set textwidth=0 wrapmargin=0 " turn off hard line wrapping
set ttimeout " removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " removes the delay when hitting esc in insert mode
set wildmenu " visually autocomplete the command menu
set wildmode=list:longest,list:full " Show a list of completions

" Check for file changes, so autoread works as expected
au CursorHold * checktime
" }}}


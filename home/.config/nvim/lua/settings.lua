require "helpers/globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- always set autoindenting on
opt.autoindent = true

-- Make Vim automatically open changed files
opt.autoread = true

-- allow backspacing over everything in insert mode
opt.backspace = "indent,eol,start"

-- Give more space for displaying messages.
opt.cmdheight = 2

-- show columns at 80 and 120
opt.colorcolumn = "80,120"

-- complete menu visibility
opt.completeopt = "menuone,noselect"

-- Highlight current line
opt.cursorline = true

-- ???
opt.diffopt = opt.diffopt + "vertical"

-- expand tabs to spaces
opt.expandtab = true

-- enable folding
opt.foldenable = true

-- open most folds by default
opt.foldlevelstart = 10

-- 10 nested folders max
opt.foldnestmax = 10

-- assume the /g flag on :s substitutions to replace all matches
opt.gdefault = true

-- Set hidden to allow buffers to be browsed
opt.hidden = true

-- With a powerful PC, we can have a huge history.
opt.history = 8192

-- Highlight search results
opt.hlsearch = true

-- as I start to search, the file jumps to the match as I type.
opt.incsearch = true

-- only redraw when needed
opt.lazyredraw = true

-- Show invisible characters
opt.list = true

-- Use these symbols for invisible
opt.listchars = "tab:▸ ,trail:·,nbsp:⎵"

-- The number of lines that is checked for set commands
opt.modelines = 1

-- Enable
opt.mouse = "a"
opt.mousemodel = "popup"

-- Prevent changing directory when opening files
opt.autochdir = false

-- disable backups
opt.backup = false

-- Disable error bells
opt.errorbells = false

-- Disable spell check
opt.spell = false

-- Don’t reset cursor to start of line when moving around.
opt.startofline = false

-- disable swap files
opt.swapfile = false

-- turn off soft wrap
opt.wrap = false

-- disable backups
opt.writebackup = false

-- Show line number
opt.number = true

-- ...but show relative numbers except for the current line
opt.relativenumber = true

-- Show ruler on the statusline
opt.ruler = true

-- When to start scrolling
opt.scrolloff = 8
opt.sidescrolloff = 15
opt.sidescroll = 1

-- use zsh as shell
opt.shell = "/bin/zsh"

-- indent by 2 spaces
opt.shiftwidth = 2

-- I: no intro message.
opt.shortmess = "I"

-- Show command line
opt.showcmd = true

-- highlight matching [{()}]
opt.showmatch = true

-- Show mode
opt.showmode = true

-- ensures new splits are to the right of current
opt.splitright = true

-- The default is 8 which is MASSIVE!!
opt.tabstop = 2

-- turn off hard line wrapping
opt.textwidth = 0 

-- turn off hard line wrapping
opt.wrapmargin = 0

-- Vim sets terminal title
opt.title = true

-- removes the delay when hitting esc in insert mode
opt.ttimeout = true

-- removes the delay when hitting esc in insert mode
opt.ttimeoutlen = 1

-- sends more characters to the screen for fast terminal connections
opt.ttyfast = true

-- Longer values (default is 4000 ms) lead to poor user experience.
opt.updatetime = 300

-- visually autocomplete the command menu
opt.wildmenu = true

-- Show a list of completions
opt.wildmode = "list:longest,list:full"

-- Turn on smart indentation. See in the docs for more info
opt.smartindent = true

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Turn off appending new line in the end of a file
opt.fixeol = false

-- Folding
opt.foldmethod = 'syntax'

-- Ignore case if all characters in lower case
opt.ignorecase = true

-- Join multiple spaces in search
opt.joinspaces = false

-- When there is a one capital letter search for exact match
opt.smartcase = true

-- Put new windows below current
opt.splitbelow = true

-- Default Plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1

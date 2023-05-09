require "helpers/globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Tabs
-- Use spaces by default
opt.expandtab = true
-- Set amount of space characters, when we press "<" or ">"
opt.shiftwidth = 2
-- 1 tab equal 2 spaces
opt.tabstop = 2
-- Turn on smart indentation. See in the docs for more info
opt.smartindent = true

-- Clipboard
-- Use system clipboard
opt.clipboard = 'unnamedplus'
-- Turn off appending new line in the end of a file
opt.fixeol = false

-- Folding
opt.foldmethod = 'syntax'

-- Search
-- Ignore case if all characters in lower case
opt.ignorecase = true
-- Join multiple spaces in search
opt.joinspaces = false
-- When there is a one capital letter search for exact match
opt.smartcase = true
-- Highlight search instances
opt.showmatch = true

-- Window
-- Put new windows below current
opt.splitbelow = true
-- Put new vertical splits to right
opt.splitright = true

-- Wild Menu
opt.wildmenu = true
opt.wildmode = "longest:full,full"

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

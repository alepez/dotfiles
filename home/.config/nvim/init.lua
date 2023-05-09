-- Bootsraping plugin manager
require "lazy-bootstrap"

-- Settings
require "settings"
require "keybindings"

vim.cmd('source ~/.config/nvim/legacy/hacks.vim')

-- Plugin management
local lazy = require("lazy")
lazy.setup("plugins")

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

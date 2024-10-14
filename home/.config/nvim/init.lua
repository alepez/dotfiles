-- Bootsraping plugin manager
require "lazy-bootstrap"

-- Settings
require "settings"

vim.cmd('source ~/.config/nvim/legacy/hacks.vim')

-- Plugin management
local lazy = require("lazy")
lazy.setup("plugins")

-- Disable Copilot at startup
vim.cmd(":Copilot disable")

require "keybindings"

vim.cmd([[autocmd CursorHold   * lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]])
vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]])

Marks=require"marks"

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

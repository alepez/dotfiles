require "helpers/globals"
require "helpers/keyboard"

-- Use Space, like key for alternative hotkeys
g.mapleader = ' '

-- LSP, Hover object
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )
-- LSP, Code actions
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- LSP, Rename an object
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- LSP, Go to declaration
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

-- Telescope, Goto declaration
nm('gd', '<cmd>Telescope lsp_definitions<CR>')
-- Telescope, Show recent files
nm('tp', '<cmd>Telescope oldfiles<CR>')
-- Telescope, Search for a file in project
nm('to', '<cmd>Telescope git_files<CR>')
-- Telescope, Show jumplist (previous locations)
nm('ti', '<cmd>Telescope jumplist<CR>')
-- Telescope, Search for a file (ignoring git-ignore)
nm('tO', '<cmd>Telescope find_files<CR>')
-- Telescope, Show git branches
nm('tb', '<cmd>Telescope git_branches<CR>')
-- Telescope, Find a string in project
nm('tf', '<cmd>Telescope live_grep<CR>')
-- Telescope, Show all buffers
nm('tq', '<cmd>Telescope buffers<CR>')
-- Telescope, Show all commands
nm('ta', '<cmd>Telescope<CR>')
-- Telescope, Search for dynamic symbols
nm('tt', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')

-- Telescope, Show all problems in project (with help of LSP)
nm('<leader>x', '<cmd>TroubleToggle<CR>')
-- Telescope, Show use of object in project
nm('gr', '<cmd>Trouble lsp_references<CR>')

-- Toggle file explorer
nm('<leader>v', '<cmd>NeoTreeFocusToggle<CR>')

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

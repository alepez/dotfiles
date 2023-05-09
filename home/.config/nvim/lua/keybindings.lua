require "helpers/globals"
require "helpers/keyboard"

-- Use Space, like key for alternative hotkeys
g.mapleader = ' '

-- LSP, declaration
nm('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')

-- LSP, definition
nm('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')

-- LSP, hover
nm('<F1>', '<Cmd>lua vim.lsp.buf.hover()<CR>')

-- LSP,  implementation
nm('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

-- LSP, signature_help
nm('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

-- LSP, type definition
nm('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- LSP, rename
nm('<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- LSP, code action
nm('<F5>', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- LSP, references
nm('gr', '<cmd>lua vim.lsp.buf.references()<CR>')

-- LSP, diagnostic
nm('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

-- LSP, prev
nm('[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- LSP, next
nm(']g', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- LSP, loclist
nm('<leader>g', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- LSP, auto format
nm('<leader>af', "<cmd>lua vim.lsp.buf.format()<CR>")

-- Telescope, Show recent files
nm('tp', '<cmd>Telescope oldfiles<CR>')

-- Telescope, Search for a file in project
nm('to', '<cmd>Telescope git_files<CR>')

-- Telescope, Show jumplist (previous locations)
nm('<leader>j', '<cmd>Telescope jumplist<CR>')

-- Telescope, Search for a file (ignoring git-ignore)
nm('<C-p>', '<cmd>Telescope find_files<CR>')

-- Telescope, Show git branches
nm('tb', '<cmd>Telescope git_branches<CR>')

-- Telescope, Find a string in project
nm('<leader>F', '<cmd>Telescope live_grep<CR>')

-- Telescope, Show all buffers
nm('<leader>o', '<cmd>Telescope buffers<CR>')

-- Telescope, Show all commands
nm('<leader>;', '<cmd>Telescope<CR>')

-- Telescope, Search for dynamic symbols
nm('<leader>s', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')

-- Telescope, Show all problems in project (with help of LSP)
-- nm('<leader>x', '<cmd>TroubleToggle<CR>') TODO collision with buffer close

-- Telescope, Show use of object in project
nm('gr', '<cmd>Trouble lsp_references<CR>')

-- Toggle file explorer
nm('<leader>ne', '<cmd>NeoTreeFocusToggle<CR>')

-- Turn off search highlight and close quickfig
nm('<leader><leader>', ':call SmartRefresh() | nohlsearch<CR>')

-- To next quickfix line
nm('<F6>', ':cn<CR>')

-- Close buffer
nm('<leader>x', ':bd<CR>')

-- Save
nm('<leader>w', ':w<CR>')

-- Split line under cursor
nm('K', 'i<CR><Esc>')

-- Search current visual selection
vm('//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>')

-- Indent keeping visual selection
vm('<', '<gv')
vm('>', '>gv')

-- Copy/Paste
vm('<leader>y', '"+y')
nm('<leader>p', '"+p')
nm('<leader>P', '"+P')

-- Copy the whole buffer to clipboard
nm('<leader>ay', 'gg"+yG')

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

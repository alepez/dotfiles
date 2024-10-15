local highlight_symbol_under_cursor = function()
  vim.lsp.buf.document_highlight()
end

local remove_highlight = function()
  vim.lsp.buf.clear_references()
end

local setup_highlight_current_symbol = function(group)
  vim.api.nvim_create_autocmd('CursorHold', {
    group = group,
    callback = highlight_symbol_under_cursor,
  })
  vim.api.nvim_create_autocmd('CursorHoldI', {
    group = group,
    callback = highlight_symbol_under_cursor,
  })
  vim.api.nvim_create_autocmd('CursorMoved', {
    group = group,
    callback = remove_highlight,
  })
end

local rust_group = vim.api.nvim_create_augroup('RustLSP', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = rust_group,
  pattern = 'rust',
  callback = function()
    setup_highlight_current_symbol(rust_group)
  end,
})

vim.g.rustaceanvim = {
  server = {
    -- cmd = function()
    --   return { "ra-multiplex" }
    -- end,
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
      end
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        workspace = {
          symbol = {
            search = {
              limit = 8192,
              kind = "all_symbols",
            },
          },
        },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

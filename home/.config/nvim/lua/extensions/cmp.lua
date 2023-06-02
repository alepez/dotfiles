local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup{
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },

  -- Mappings for cmp
  mapping = {

    -- Autocompletion menu
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
    -- Turn off autocomplete
    -- ['<Tab>'] = cmp.config.disable,
    -- Turn on autocomplete
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Use <C-e> to abort autocomplete
    ['<C-e>'] = cmp.mapping({
      -- Abort completion
      i = cmp.mapping.abort(),
      -- Close completion window
      c = cmp.mapping.close(),
    }),

    -- Navigate through completion variants
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
  },

  sources = cmp.config.sources({
    -- LSP
    { name = 'nvim_lsp' },
    -- LSP for parameters in functions
    { name = 'nvim_lsp_signature_help' },
    -- Lua Neovim API
    { name = 'nvim_lua' },
    -- Luasnip
    { name = 'luasnip' },
    -- Buffers
    { name = 'buffer' },
    -- Paths
    { name = 'path' },
    -- Copilot
    { name = "copilot" },
  }, {
  }),
  formatting = {
    format = lspkind.cmp_format({
      -- Show only symbol annotations
      mode = 'symbol',
      -- Prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      maxwidth = 50,
    })
  }
}

-- Add snippets from Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()

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
    -- Turn off autocomplete on <CR>
    ['<CR>'] = cmp.config.disable,
    -- Turn on autocomplete on <C-y>
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    -- Use <C-e> to abort autocomplete
    ['<C-e>'] = cmp.mapping({
      -- Abort completion
      i = cmp.mapping.abort(),
      -- Close completion window
      c = cmp.mapping.close(),
    }),

    -- Use <C-p> and <C-n> to navigate through completion variants
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
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
    -- Emoji
    { name = "emoji" },
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
require("luasnip/loaders/from_vscode").lazy_load()


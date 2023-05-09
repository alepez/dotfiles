require'nvim-treesitter.configs'.setup {

  -- Needed parsers
  ensure_installed = {
    "c",
    "lua",
    "typescript",
    "javascript",
    "rust",
  },

  -- Install all parsers synchronously
  sync_install = false,

  highlight = {
    -- Enabling highlight for all files
    enable = true,
    disable = {},
  },

  indent = {
    -- Disabling indentation for all files
    enable = false,
    disable = {},
  }
}

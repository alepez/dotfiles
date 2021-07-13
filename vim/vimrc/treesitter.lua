require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dockerfile",
    "javascript",
    "lua",
    "python",
    "rust",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
}

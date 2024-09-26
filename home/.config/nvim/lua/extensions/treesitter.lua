require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dockerfile",
    "javascript",
    "lua",
    "python",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    -- No cpp because C++17 nested namespaces (which I use) are not supported
    disable = { "cpp" },
  },
}

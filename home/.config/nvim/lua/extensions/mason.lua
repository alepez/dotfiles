local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    -- LSP for Lua language
    "lua_ls",
    -- LSP for Typescript and Javascript
    "tsserver",
    -- LSP for Emmet (Vue, HTML, CSS)
    "emmet_ls",
    -- LSP for CSS
    "cssls",
    -- LSP for Docker
    "dockerls",
    -- LSP for Python
    "pyright",
    -- LSP for Vue
    "volar"
  }
});

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,
}

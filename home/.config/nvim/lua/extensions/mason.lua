local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cssls",
    "jedi_language_server",
    -- "hls",
    "html",
    -- "rust_analyzer", -- Managed by rust-tools
    "lua_ls",
    "taplo",
    "tsserver",
    "yamlls",
    "zls",
  }
});

local default_opts = {
  flags = {
    debounce_text_changes = 150,
  }
}

local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local custom_opts = {
  ["html"] = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true,
  },
  ["rust-analyzer"] = {
    procMacro = {
      enable = true
    },
    cargo = {
      loadOutDirsFromCheck = true,
    },
    diagnostics = {
      disabled = {
        "unresolved-proc-macro"
      }
    }
  },
  ["lua_ls"] = {
    cmd = {  "/usr/bin/lua-language-server" };
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = lua_runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          -- Avoid asking about working environment on every startup
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  ["yamlls"] = {
    settings = {
    --   yaml = {
    --     schemas = {
    --       ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    --     },
    --   },
    }
  }
}

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {
  function (server_name)

    local opts = custom_opts[server_name]

    if opts == nil then
      opts = default_opts
    else
      opts = vim.tbl_extend("keep", opts, default_opts)
    end

    lspconfig[server_name].setup(opts)
  end,
}

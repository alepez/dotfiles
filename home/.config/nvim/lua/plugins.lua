require "helpers/globals"
require "helpers/keyboard"

return {

  -- Portable package manager for Neovim that runs everywhere Neovim runs. 
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "extensions.mason"
    end
  },

  -- Neovim plugin to manage the file system and other tree like structures.
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "extensions.neotree"
    end
  },

  -- Find, Filter, Preview, Pick. All lua, all the time.
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },

  -- A completion engine
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      -- nvim-cmp source for neovim's built-in language server client.
      "hrsh7th/cmp-nvim-lsp",
      -- nvim-cmp source for filesystem paths
      "hrsh7th/cmp-path",
      -- This repository transforms https://github.com/zbirenbaum/copilot.lua into a cmp source.
      "zbirenbaum/copilot-cmp",
      -- helps managing crates.io dependencies
      "Saecki/crates.nvim",
      -- nvim-cmp source for buffer words.
      "hrsh7th/cmp-buffer",
      -- nvim-cmp source for displaying function signatures with the current parameter emphasized
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      require "extensions.cmp"
    end
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require "extensions.lspkind"
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      warn_no_results = false,
      open_no_results = true,
      auto_preview = false,
      modes = {
        local_errors = {
          mode = 'diagnostics',
          filter = {
            severity = vim.diagnostic.severity.ERROR,
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
          win = {
            position = 'left',
            size = 70,
          },
        },
        local_warnings = {
          mode = 'diagnostics',
          filter = { buf = 0 },
          win = {
            position = 'left',
            size = 70,
          },
        },
      },
    },
    cmd = "Trouble",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    -- When upgrading the plugin, you must make sure that all installed parsers 
    -- are updated to the latest version via :TSUpdate
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "extensions.tokyonight"
    end,
  },

  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require "extensions.comment"
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require "extensions.surround"
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "extensions.lualine"
    end
  },

  -- provides various functions for building Neovim plugins
  {
    "nvim-lua/plenary.nvim",
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "johnfrankmorgan/whitespace.nvim",
    config = function()
      require('whitespace-nvim').setup({
        highlight = 'DiffDelete',
        ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
        ignore_terminal = true,
      })
    end
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = vim.fn.expand("~/.dotfiles/bin/chatgpt-api-key"),
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false, -- This plugin is already lazy
    config = function()
      require "extensions.rustaceanvim"
    end
  },

  -- helps managing crates.io dependencies.
  {
    "Saecki/crates.nvim",
  },

  {
    "nvim-lua/lsp-status.nvim",
  },

  {
    "benfowler/telescope-luasnip.nvim",
    config = function()
      require("telescope").load_extension("luasnip")
    end,
  },

  --  to jump anywhere in a document with as few keystrokes as possible
  {
    "ggandor/leap.nvim",
  },

  {
    "nvim-telescope/telescope-ui-select.nvim"
  },
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

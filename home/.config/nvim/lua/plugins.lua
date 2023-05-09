require "helpers/globals"

return {
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

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },

  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "extensions.cmp"
    end
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
    end
  },

  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      require "extensions.colorscheme.gruvbox"
    end
  },


  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require('Comment').setup({
        -- Add a space b/w comment and the line
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        -- Lines to be ignored while (un)comment
        ignore = nil,
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
          -- Line-comment toggle keymap
          line = 'gcc',
          -- Block-comment toggle keymap
          block = 'gbc',
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          -- Line-comment keymap
          line = 'gc',
          -- Block-comment keymap
          block = 'gb',
        },
        -- LHS of extra mappings
        extra = {
          -- Add comment on the line above
          above = 'gcO',
          -- Add comment on the line below
          below = 'gco',
          -- Add comment at the end of line
          eol = 'gcA',
        },
        -- Enable keybindings
        -- NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          -- Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        -- Function to call before (un)comment
        pre_hook = nil,
        -- Function to call after (un)comment
        post_hook = nil,
      })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0

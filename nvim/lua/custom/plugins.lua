-- Some additional plugins

return {
  -- lsp stuff
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null_ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    dependencies = { "jose-elias-alvarez/null-ls.nvim" },
  },
  -- some addictive plugins
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "farmergreg/vim-lastplace", lazy = false },
  -- sudo write
  { "lambdalisue/suda.vim", lazy = false },
  -- ui
  { "dstein64/nvim-scrollview", lazy = false },
  { "simnalamburt/vim-mundo", cmd = { "MundoToggle" } },
  -- filetypes
  { "towolf/vim-helm", lazy = false },
  -- jupyter integration
  {
    "dccsillag/magma-nvim",
    run = ":UpdateRemotePlugins",
    -- cmd = { "MagmaInit", },
  },
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_browser = "/bin/true"
    end,
    -- setup = function()
    --   --   vim.g.mkdp_filetypes = { "markdown" }
    -- end,
    ft = { "markdown" },
  },
  -- cmp overrides
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local defaults = require "plugins.configs.cmp"
      local custom = require "custom.configs.cmp"
      return vim.tbl_deep_extend("force", defaults, custom)
    end,
  },
  -- {"zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {
  --       panel = {
  --         enabled = true,
  --         auto_refresh = false,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>",
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = false,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<M-l>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         python = true,
  --         javascript = true,
  --         typescript = true,
  --       },
  --     }
  --     -- require("copilot").setup {
  --     -- suggestion = { enabled = false },
  --     -- panel = { enabled = false },
  --     -- }
  --   end,
  -- },
  -- {"zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- nvim tree overrides
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local defaults = require "plugins.configs.nvimtree"
      local custom = require "custom.configs.nvim_tree"
      return vim.tbl_deep_extend("force", defaults, custom)
    end,
  },
  -- Mason overrides
  {
    "williamboman/mason.nvim",
    opts = function()
      local defaults = require "plugins.configs.mason"
      local custom = require "custom.configs.mason"
      return vim.tbl_deep_extend("force", defaults, custom)
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local defaults = require "plugins.configs.treesitter"
      local custom = require "custom.configs.treesitter"
      return vim.tbl_deep_extend("force", defaults, custom)
    end,
  },
}

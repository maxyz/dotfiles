-- Some additional plugins

return {
  -- lsp stuff
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.configs.null_ls"
    end,
  },
  -- some addictive plugins
  ["tpope/vim-abolish"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-unimpaired"] = {},
  ["farmergreg/vim-lastplace"] = {
    event = { "BufRead" },
  },
  -- sudo write
  ["lambdalisue/suda.vim"] = {},
  -- ui
  ["dstein64/nvim-scrollview"] = {},
  ["simnalamburt/vim-mundo"] = {},
  -- filetypes
  ["towolf/vim-helm"] = {},
  -- jupyter integration
  ["dccsillag/magma-nvim"] = {
    run = ":UpdateRemotePlugins",
    -- cmd = { "MagmaInit", },
  },
  -- markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_browser = "/bin/true"
    end,
    ft = { "markdown" },
  },
  -- cmp overrides
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      return require "custom.configs.cmp"
    end,
  },
  -- ["zbirenbaum/copilot.lua"] = {
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
  -- ["zbirenbaum/copilot-cmp"] = {
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- nvim tree
  ["nvim-tree/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    override_options = function()
      return require "custom.configs.nvim_tree"
    end,
  },
  -- Mason overrides
  ["williamboman/mason.nvim"] = {
    override_options = function()
      return require "custom.configs.mason"
    end,
  },
  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = function()
      return require "custom.configs.treesitter"
    end,
  },
}

return {
  -- lsp stuff
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    -- lazy = false,
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- some addictive plugins
  { "tpope/vim-abolish",        lazy = false },
  { "tpope/vim-repeat",         lazy = false },
  { "tpope/vim-surround",       lazy = false },
  { "tpope/vim-unimpaired",     lazy = false },
  { "farmergreg/vim-lastplace", lazy = false },
  -- sudo write
  { "lambdalisue/suda.vim",     lazy = false },
  -- git integration
  { "tpope/vim-fugitive",       cmd = "Git" },
  -- ui
  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  -- filetypes
  { "towolf/vim-helm",               lazy = false },
  -- use blink by default
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = require "configs.blink",
  },
  -- cmp overrides
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = require "configs.cmp",
  -- },
  -- nvim tree overrides
  {
    "nvim-tree/nvim-tree.lua",
    event = "BufEnter",
    opts = require "configs.nvimtree",
  },
  -- Mason overrides
  {
    "mason-org/mason.nvim",
    opts = require "configs.mason",
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- branch = "main",
    opts = require "configs.treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
  },
  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      {
        "<leader>tt",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tT",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    config = function()
      require("trouble").setup()
    end,
  },
  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zenmode"
    end,
  },
  -- Go directly to a line
  {
    "bogado/file-line",
    lazy = false,
  },
  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = { extensions_list = { "fzf", "glyph", "terms" } },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "ghassan0/telescope-glyph.nvim" },
    },
  },
  {
    "nvchad/base46",
    branch = "v3.0",
  },
  -- disable
  { "windwp/nvim-autopairs", enabled = false },
}

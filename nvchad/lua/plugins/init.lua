-- Some additional plugins

return {
  -- lsp stuff
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require "configs.null_ls"
  --   end,
  -- },
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
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    -- dependencies = { "jose-elias-alvarez/null-ls.nvim" },
  },
  -- some addictive plugins
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "farmergreg/vim-lastplace", lazy = false },
  -- sudo write
  { "lambdalisue/suda.vim", lazy = false },
  -- git integration
  { "tpope/vim-fugitive", cmd = "Git" },
  -- ui
  -- { "dstein64/nvim-scrollview", lazy = false },
  -- { "simnalamburt/vim-mundo", cmd = { "MundoToggle" } },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  -- filetypes
  { "towolf/vim-helm", lazy = false },
  -- jupyter integration
  -- {
  --   "dccsillag/magma-nvim",
  --   build = ":UpdateRemotePlugins",
  --   -- cmd = { "MagmaInit" },
  --   -- lazy = false,
  -- },
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
  -- {
  --   'toppair/peek.nvim',
  --   build = "deno task --quiet build:fast",
  --   config = function()
  --     require("peek").setup()
  --     vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  --   end,
  --   ft = { "markdown" },
  -- }
  -- cmp overrides
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("luasnip").config.set_config(opts)

          local luasnip = require "luasnip"

          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          luasnip.filetype_extend("svelte", { "html" })

          require "nvchad.configs.luasnip"
        end,
      },

      -- ai based completion
      {
        "Exafunction/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
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
  -- Codium
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  -- Cody plugin
  -- {
  --   "sourcegraph/sg.nvim",
  --   event = "BufEnter",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("sg").setup()
  --   end,
  -- },
  -- ollama using gen.nvim
  -- { "David-Kunz/gen.nvim", opts = { model = "codellama" }, cmd = "Gen" },
  -- nvim tree overrides
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  -- Mason overrides
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
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
    opts = { extensions_list = { "fzf", "glyph" , 'terms'} },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "ghassan0/telescope-glyph.nvim" },
    },
  },
}

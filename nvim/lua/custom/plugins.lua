-- Some additional plugins
-- local map = require("core.utils").map

return {
  { "williamboman/nvim-lsp-installer",
    config = function()
      require("custom.configs.lspconfig").setup_lsp()
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    after = { "nvim-lspconfig", "plenary.nvim" },
    setup = function ()
      require("custom.configs.null-ls").setup()
    end,
    -- setup = require("null-ls").setup(),
    requires = { "plenary.nvim" },
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "dietsche/vim-lastplace" },
  { "lambdalisue/suda.vim" },
  { "dstein64/nvim-scrollview" },
  { "sjl/gundo.vim",
    setup = function()
      vim.g.gundo_prefer_python3 = 1
    end,
  },
}

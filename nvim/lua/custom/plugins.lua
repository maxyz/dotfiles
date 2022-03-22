-- Some additional plugins

return {
  {
    "williamboman/nvim-lsp-installer",
  },
  { "jose-elias-alvarez/null-ls.nvim",
    after = { "nvim-lspconfig", "plenary.nvim" },
    setup = function ()
      require("custom.configs.null_ls").setup()
    end,
    requires = { "plenary.nvim" },
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "lambdalisue/suda.vim" },
  { "dstein64/nvim-scrollview" },
  { "sjl/gundo.vim",
    setup = function()
      vim.g.gundo_prefer_python3 = 1
    end,
  },
  { "towolf/vim-helm" },
}

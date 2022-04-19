-- Some additional plugins

return {
  -- lsp stuff
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
  -- some addictive plugins
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "farmergreg/vim-lastplace",
    event = { "BufRead", },
  },
  -- sudo write
  { "lambdalisue/suda.vim" },
  -- ui
  { "dstein64/nvim-scrollview" },
  { "sjl/gundo.vim",
    setup = function()
      vim.g.gundo_prefer_python3 = 1
    end,
  },
  -- filetypes
  { "towolf/vim-helm" },
}

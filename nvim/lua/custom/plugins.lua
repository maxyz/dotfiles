-- Some additional plugins

return {
  -- lsp stuff
  [ "jose-elias-alvarez/null-ls.nvim" ] = {
    after = "nvim-lspconfig",
    config = function ()
      require("custom.configs.null_ls").setup()
    end,
  },
  -- some addictive plugins
  [ "tpope/vim-abolish" ] = {},
  [ "tpope/vim-repeat" ] = {},
  [ "tpope/vim-surround" ] = {},
  [ "tpope/vim-unimpaired" ] = {},
  [ "farmergreg/vim-lastplace" ] = {
    event = { "BufRead", },
  },
  -- sudo write
  [ "lambdalisue/suda.vim" ] = {},
  -- ui
  [ "dstein64/nvim-scrollview" ] = {},
  [ "sjl/gundo.vim" ] = {
    setup = function()
      vim.g.gundo_prefer_python3 = 1
    end,
  },
  -- filetypes
  [ "towolf/vim-helm" ] = {},
  [ "goolord/alpha-nvim" ] = {
    disable = false,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  },
}

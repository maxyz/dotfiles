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

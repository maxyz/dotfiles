local M = {}

local userPlugins = require("custom.plugins")
local nvimTreeConfigs = require("custom.configs.nvim_tree")
local cmpConfigs = require("custom.configs.cmp")

M.options = {
}

M.plugins = {
  override = {
    [ "hrsh7th/nvim-cmp" ] = cmpConfigs,
    [ "kyazdani42/nvim-tree.lua" ] = nvimTreeConfigs,
  },
  user = userPlugins,
  options = {
    lspconfig = {
      setup_lspconf = "custom.configs.lspconfig",
    },
  },
}

M.ui = {
  theme = "mountain",
}

M.mappings = require("custom.mappings")

return M

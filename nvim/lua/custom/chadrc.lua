local M = {}

local userPlugins = require("custom.plugins")
local nvimTreeConfigs = require("custom.configs.nvim-tree")

M.options = {
  lspconfig = {
    setup_lspconf = "custom.configs.lspconfig",
  }
}

M.ui = {
   theme = "mountain",
}

M.plugins = {
  install = userPlugins,
  default_plugin_config_replace = {
    nvim_tree = nvimTreeConfigs,
  },
  options = {
    nvimtree = {
      lazy_load = false,
    },
  },
}

return M

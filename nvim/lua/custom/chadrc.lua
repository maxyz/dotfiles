local M = {}

local userPlugins = require("custom.plugins")
local nvimTreeConfigs = require("custom.configs.nvim-tree")

M.mappings = {
  plugins = {
    nvimtree = {
      focus = "",
    },
  },
}

M.options = {
  lspconfig = {
    setup_lspconf = "custom.configs.lspconfig",
  }
}

M.plugins = {
  default_plugin_config_replace = {
    nvim_tree = nvimTreeConfigs,
  },
  install = userPlugins,
  options = {
    nvimtree = {
      lazy_load = false,
    },
  },
  status = {
    colorizer = true,
    alpha = true,
  },
}

M.ui = {
   theme = "mountain",
}

return M

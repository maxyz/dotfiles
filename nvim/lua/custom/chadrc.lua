local M = {}

local userPlugins = require("custom.plugins")
local nvimTreeConfigs = require("custom.configs.nvim_tree")
local cmpConfigs = require("custom.configs.cmp")

M.mappings = {
  plugins = {
    nvimtree = {
      focus = "",
    },
  },
}

M.options = {
}

M.plugins = {
  default_plugin_config_replace = {
    nvim_cmp = cmpConfigs,
    nvim_tree = nvimTreeConfigs,
  },
  install = userPlugins,
  options = {
    nvimtree = {
      lazy_load = false,
    },
    lspconfig = {
      setup_lspconf = "custom.configs.lspconfig",
    }
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
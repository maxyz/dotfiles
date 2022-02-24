local M = {}

local userPlugins = require("custom.plugins")
-- local configLspConfig = require "custom.configs.lspconfig"
require("custom.configs.nvim-tree")

M.options = {
  lspconfig = {
    setup_lspconf = "custom.configs.lspconfig",
  }
}

M.ui = {
   theme = "mountain",
}

M.plugins = {
  install = userPlugins
}

return M
